import pandas as pd
import matplotlib.pyplot as plt
from sklearn import tree
from sklearn.ensemble import RandomForestClassifier
import numpy as np
from sklearn.ensemble import GradientBoostingClassifier
import copy
#from keras.models import Sequential
#from keras.layers import Dense
#from sklearn.cluster import KMeans
import heapq
from sklearn import svm
from sklearn.feature_selection import RFE
from sklearn.feature_selection import SequentialFeatureSelector
from sklearn.model_selection import GridSearchCV
from sklearn.model_selection import RandomizedSearchCV
from sklearn.metrics import accuracy_score
import pickle

class FeatureSelector():
#https://towardsdatascience.com/why-feature-correlation-matters-a-lot-847e8ba439c4
    k = 0
    x_new = 0


    def __init__(self, x, y, x_test, y_test):
        self.x = x
        self.y = y
        self.x_test = x_test
        self.y_test = y_test
#        self.clf = clf

    def selectKBest_filter(self,k):
        self.k = 0
        x_new = self.selectKBestInd(k,self.x,self.y,self.x_test,self.y_test)
        return x_new

    def recursive_feat_selec(self, n_feat):
        selector = RFE(self.clf, n_features_to_select=n_feat, step=1)
        selector = selector.fit(self.x, self.y)
        print("selected recursive features")
        print(selector.support_)
        print("feature ranking")
        print(selector.ranking_)

        #f = open('augm_feature_ranking.pckl', 'wb')


        #pickle.dump(selector.ranking_, f)
        #f.close()

        y_pred = selector.predict(self.x_test)
        accuracy = 0
        for i,res in enumerate(self.y_test):
            if res == y_pred[i]:
                accuracy += 1
        return accuracy


    def sequential_feat_selec(self, n_feat):
        sfs = SequentialFeatureSelector(self.clf, n_features_to_select=n_feat)
        sfs.fit(self.x, self.y)
        print("selected sequential features")
        print(sfs.support_)
        print("feature ranking")
        print(sfs.get_support())
        sfs.get_support()
        # reduce selected features

        new_X = sfs.transform(self.x)
        #new_X = copy.deepcopy(self.x)
        #sfs.inverse_transform(self.x)
        self.clf.fit(new_X, self.y)

        new_X_test = sfs.transform(self.x_test)
        #new_X_test = copy.deepcopy(self.x_test)
        #sfs.inverse_transform(self.x_test)

        y_pred = self.clf.predict(new_X_test)
        accuracy = 0
        for i, res in enumerate(self.y_test):
            if res == y_pred[i]:
                accuracy += 1
        return accuracy

    def select_model(self, model_name, n_cl = None):
        if model_name =="dt":
            self.clf = tree.DecisionTreeClassifier(random_state=0)
        elif model_name =="svm":
            self.clf = svm.SVC(random_state=0)
        elif model_name =="xgb":
            self.clf = GradientBoostingClassifier(random_state=0)
        elif model_name == "rf":
            self.clf = RandomForestClassifier(random_state=0)
        elif model_name =="kmean":
            self.clf = KMeans(n_clusters=n_cl, random_state=0)

    def train_and_test(self):
        self.clf = self.clf.fit(self.x, self.y)
        print("Model Parameters before hyper-parameters tuning")
        print(self.clf.get_params())
        self.y_predicted_no_tune_tr = self.clf.predict(self.x)
        self.train_best_acc = accuracy_score(self.y, self.y_predicted_no_tune_tr)
        print("Train best Accuracy")
        print(self.train_best_acc)
        self.y_predicted_no_tune = self.clf.predict(self.x_test)
        self.test_best_acc = accuracy_score(self.y_test, self.y_predicted_no_tune)
        print("Test best Accuracy")
        print(self.test_best_acc)


    def test_tuned_results(self):
        self.clf_best_estimator = self.clf_best_estimator.fit(self.x, self.y)
        print("Model Parameters after hyper-parameters tuning")
        print(self.clf_best_estimator)
        self.y_predicted_train = self.clf_best_estimator.predict(self.x)
        self.train_best_acc = accuracy_score(self.y, self.y_predicted_train)
        print("Train best Accuracy")
        print(self.train_best_acc)
        self.y_predicted = self.clf_best_estimator.predict(self.x_test)
        self.test_best_acc = accuracy_score(self.y_test, self.y_predicted)
        print("Test best Accuracy")
        print(self.test_best_acc)

    def hyper_paramter_tuning(self, parameters, hyper_tune_method):

        if hyper_tune_method == "Grid":
            clf_tuned = GridSearchCV(self.clf, parameters)
            clf_tuned.fit(self.x, self.y)
            self.clf_best_estimator = clf_tuned.best_estimator_

        elif hyper_tune_method == "Rand":
            clf_tuned = RandomizedSearchCV(self.clf, parameters)
            clf_tuned.fit(self.x, self.y)
            self.clf_best_estimator = clf_tuned.best_estimator_

    def eliminateWorstInd(self,k):
        ind = list(range(0,len(self.x[0])))
        bases = []
        bases.append(self.train(self.x, self.y, self.x_test, self.y_test))
        for j in range(len(self.x[0])-k):
            new_base = []
            print(bases[-1])
            for i in range(len(x[0])):
                x_new = self.removeFeature(i,x)
                x_test_new = self.removeFeature(i, self.x_test)
                new_base.append(self.train(x_new, self.y, x_test_new, self.y_test))

            bases.append(max(new_base))
            min_index = new_base.index(max(new_base))
            x = self.removeFeature(min_index,x)
            self.x_test = self.removeFeature(min_index, self.x_test)
            ind.pop(min_index)

        plt.plot(bases)
        plt.show()
        return ind

    #removeFeatures, SelectFeatures, Hyperparameter GridSearch
    def selectKBestInd(self, k):
        ind = []
        bases = []
        bases.append(0)
        x_new = []
        x_test_new = []
        for j in range(k):
            new_base = []
            x_hat = []
            x_test_hat = []
            print(bases[-1])
            for i in range(len(self.x[0])):
                x_hat = self.addFeature(i,x_new,self.x)
                x_test_hat = self.addFeature(i,x_test_new, self.x_test)
                new_base.append(self.train(x_hat, self.y, x_test_hat, self.y_test))

            loop = True
            n = 1
            while loop:
                if new_base.index(sorted(new_base)[-n]) not in ind:
                    bases.append(sorted(new_base)[-n])
                    min_index = new_base.index(sorted(new_base)[-n])
                    x_new = self.addFeature(min_index, x_new, self.x)
                    x_test_new = self.addFeature(min_index, x_test_new, self.x_test)
                    ind.append(min_index)
                    loop = False
                else:
                    n+=1


        plt.plot(bases)
        plt.show()
        return ind



    def train(self,x,y,x_test,y_test):
        clf = tree.DecisionTreeClassifier()
        clf = clf.fit(x, y)
        result_est = clf.predict(x_test)
        #y_test = dataset.testResults()
        rightsamples = 0
        for i in range(len(result_est)):
            if result_est[i] == y_test[i]:
                rightsamples += 1
        return rightsamples / len(y_test)

    def train_nn(self,x,y,x_test,y_test):
        model = Sequential()
        model.add(Dense(12, input_dim=len(x[0]), activation='relu'))
        model.add(Dense(1, activation='relu'))
        model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])
        model.fit(x, y, epochs=150, batch_size=10)

        result_est = model.predict(x_test)
        result_est = [np.round(x) for x in result_est]
        #y_test = dataset.testResults()
        rightsamples = 0
        for i in range(len(result_est)):
            if result_est[i] == y_test[i]:
                rightsamples += 1
        return rightsamples / len(y_test)

    def train_rf(self,x,y,x_test,y_test):
        clf = RandomForestClassifier(max_depth=2, random_state=0)
        clf = clf.fit(x, y)
        result_est = clf.predict(x_test)
        #y_test = dataset.testResults()
        rightsamples = 0
        for i in range(len(result_est)):
            if result_est[i] == y_test[i]:
                rightsamples += 1
        return rightsamples / len(y_test)

    def removeFeature(self,k,x):
        x_new = []
        for tile in x:
            tile_new = []
            for i,datapoint in enumerate(tile):
                if k != i:
                    tile_new.append(datapoint)
            x_new.append(tile_new)
        return x_new

    def addFeature(self,k,x_hat,x):
            x_new = copy.deepcopy(x_hat)
            for j,tile in enumerate(x):
                tile_new = []
                for i,datapoint in enumerate(tile):
                    if k == i:
                        tile_new.append(datapoint)
                if len(x_new) > j:
                    x_new[j].append(tile_new[0])
                else:
                    x_new.append(tile_new)
            return x_new


    def plotCorrelationMatrix(Data):
        DSpd = pd.DataFrame(data=Data)
        correlations = DSpd.corr()
        plt.imshow(correlations, vmin=-1, vmax=1)
        plt.show()