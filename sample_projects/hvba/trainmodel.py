import numpy as np
import matplotlib.pyplot as plt
import random
from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import chi2
import pandas as pd
from sklearn import tree
import seaborn as sns

from Functions.createdataset import Dataset
from Functions.featureselection import FeatureSelector



# In this mainfile a lot of different methods are used. Creating the Dataset and analyzing the dataset are the keyfeatures that are used here.
if __name__ == "__main__":



    # Dataset is created and imported
    dataset = Dataset()

    dataset.import_df()


    #for i in range (1000):
    #    decision = randrange(2)
    #    if decision == 0:
    #        dataset.addSynthesisedTile(True)
    #    else:
    #        dataset.addSynthesisedTile(False)


    # For creating (=synthesizing) a new Dataset the following Code can be used:


    # for i in range (1000):
    #     decision = randrange(2)
    #     if decision == 0:
    #         dataset.addSynthesisedTile(True)
    #     else:
    #         dataset.addSynthesisedTile(False)
    # #
    # dataset.extract_df()



    #300x erstellen, corrillation matrix, feature selection mit decision trees(), different methods can be used to generate the dataset:


    #dataset.addTileFromXLSX("Data/Daten_Analyse_Rahmen_THL334.xlsx",1)
    #dataset.addTileFromXLSX("Data/Daten_Analyse_Rahmen_THL335.xlsx", 0)
    #dataset.addTileFromXLSX("Data/Daten_Analyse_Rahmen_THL338.xlsx", 1)
    #dataset.addTileFromXLSX("Data/Daten_Analyse_Rahmen_THL338.xlsx", 1)

    #dataset.getFachGradient(0.8)

    #dataset.addSynthesisedTile(True)
    #dataset.addTileFromXLSXSheet("Data/PPE41_Ebenheitsauswertung_EWL3.xlsx", 0, "THL280")
    #dataset.addTileFromXLSXSheet("Data/PPE41_Ebenheitsauswertung_EWL3.xlsx", 0, "THL279")


    #dataset.addSynthesisedTile(False)
    #dataset.addSynthesisedTile(True)
    #    dataset.extract_df()


    # correct the ebenheit if the values should be somehow wrong:

    dataset.predictwithebenheit()
    #dataset.extract_df()

    #Split a testdata from dataset
    #dataset.extract_df()

    dataset.createTestData(100)


    #Create X and Y data from the Dataset
    DS = np.array(dataset.get2D())
    RD = np.array(dataset.results())

    x = dataset.transformX(DS,[0,1,2])

    #X_new = SelectKBest(chi2, k=2).fit_transform(DS,RD)
    clf = tree.DecisionTreeClassifier()
    #clf = RandomForestClassifier(max_depth=5, random_state=0)
    clf = clf.fit(DS,RD)
    result_est = clf.predict(dataset.get2DTest())
    result_pred = dataset.testResults()
    #tree.plot_tree(clf)
    accuracy = 0
    for i, res in enumerate(result_est):
        if res == result_pred[i]:
            accuracy += 1

    featureselection = FeatureSelector(clf,DS,RD,dataset.get2DTest(),dataset.testResults())
    featureselection.recursive_feat_selec(1)

    #x = []
    #y = []
    #for i in range(1,44):
    #    accuracy = featureselection.sequential_feat_selec(i)
    #    print(accuracy)
    ##    x.append(i)
     #   y.append(accuracy)
    #plt.plot(x,y)
    #plt.show()

    #dataset.plotRahmenAs3D(dataset.getTile(-2))

    #featureselection.FeatureSelector.plotCorrelationMatrix(DS)
    dataset.plotRahmen(dataset.getTile(-1))
    dataset.plotMultiRahmenAsLineMatrix([dataset.getTile(-1),dataset.getTile(-2),dataset.getTile(-3)])
    dataset.RahmenAsLine(dataset.getTile(-1))
    #featureselection.FeatureSelector.plotCorrelationMatrix(DS)
    #print(tile1)