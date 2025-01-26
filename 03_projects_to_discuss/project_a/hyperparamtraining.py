import numpy as np
from Functions.createdataset import Dataset
from Functions.featureselection import FeatureSelector
import matplotlib.pyplot as plt



#This File is for Hyperparameter Search and for trying different trainings.

if __name__ == "__main__":

    dataset = Dataset()
    dataset.import_df()
    dataset.createTestData(100)


    features_random = [1, 6, 7, 8, 16, 25, 37, 38, 43, 44]
    features_augmented = [17, 18, 36, 39, 44]
    features =features_augmented #from all features only the best should be used to make a decision if NIO or IO. To find out the best Featrues use Featureselection methods

    DS =  dataset.transformX(np.array(dataset.get2D()),features)
    RD = np.array(dataset.results())



    ft = FeatureSelector(DS, RD,  dataset.transformX(dataset.get2DTest(),features), dataset.testResults())
    ft.select_model("dt")
    ft.train_and_test()
    param_dt = {
    'max_depth': [1,2,5,7],#, 50, 100, 500, 1000],#[ 5, 8, 10, 12, 13, 14, 15, 16, 17, 18, 20], #2, 3, #30, 50, 60], #100, 500, 1000],
    'min_samples_leaf': [1,5,10,20,50, 100, 200, 500]#7, 8, 9, 10, 11, 12, 13, 14, 15, 17],#20, 50, 100, 500] #[1, 2, 1, 2, 5,
}
    ft.hyper_paramter_tuning(param_dt, "Grid")
    ft.test_tuned_results()

     # arguments are passed to np.histogram



    ft.select_model("svm")
    ft.train_and_test()
    #    ft.train_and_test()
    param_svm = {
        'gamma' : [0.0001, 0.001,0.01, 0.1, 1,5, 10],#0.00015, 0.0002, 0.00021, 0.00022, 0.00023, 0.00024, 0.00025, 0.00026, 0.00027, 0.0003], #0.0004, 0.0005, 0.001, 0.01],#, 1, 5, 10],
        'C': [0.1, 0.5,1, 5, 10, 50, 100]#50, 55, 60, 65, 70, 75, 80],#90, 100] #[0.1, 1, 5, 10, 20, 50, 100]
    }
    ft.hyper_paramter_tuning(param_svm, "Grid")
    ft.test_tuned_results()


#    ft.test_tuned_results()
    ft.select_model("rf")
    ft.train_and_test()
    #    ft.train_and_test()
    param_rf = {
        'n_estimators' : [10, 50, 100, 200, 500],
        'max_depth':  [1,2,3,4],
        # [ 5, 8, 10, 12, 13, 14, 15, 16, 17, 18, 20], #2, 3, #30, 50, 60], #100, 500, 1000],
        'min_samples_leaf': [1, 5, 10, 20, 50, 100, 200, 500]  #
        # 'max_depth': [2, 3, 5, 10, 20, 100, 500, 1000],
        # 'min_samples_leaf': [1, 2, 5, 10, 20, 50, 100, 500]
    }
    ft.hyper_paramter_tuning(param_rf, "Grid")

    ft.test_tuned_results()
    ft.select_model("xgb")
    ft.train_and_test()
    param_xgb = {
        'n_estimators' : [10, 50, 100, 200, 500],
        'max_depth': [5, 10, 50, 100, 500, 1000],
        # [ 5, 8, 10, 12, 13, 14, 15, 16, 17, 18, 20], #2, 3, #30, 50, 60], #100, 500, 1000],
        'min_samples_leaf': [1, 5, 10, 20, 50, 100, 200, 500]  #
        # 'max_depth': [2, 3, 5, 10, 20, 100, 500, 1000],
        # 'min_samples_leaf': [1, 2, 5, 10, 20, 50, 100, 500]
    }
    ft.hyper_paramter_tuning(param_xgb, "Grid")

    result_pred = ft.clf_best_estimator.predict(dataset.transformX(dataset.get2DTest(), features))
    result_est = dataset.testResults()

    accuracy = 0
    ebenheit = []
    iocount = 0
    for i, res in enumerate(result_est):
        if res == 1:
            iocount += 1
        if res == result_pred[i]:
            accuracy += 1
        else:
            tile = dataset.get2DTest()[i]
            subtile = tile[0:45]
            maxi = np.max(subtile)
            mini = np.min(subtile)
            ebenheit.append(maxi - mini)
            print(ebenheit[-1])
    print(iocount)
    print(accuracy)
    _ = plt.hist(ebenheit, bins='auto')
    plt.title("Histogram with 'auto' bins")
    # Text(0.5, 1.0, "Histogram with 'auto' bins")

    plt.show()
