import numpy as np
from Functions.createdataset import Dataset
from Functions.featureselection import FeatureSelector

if __name__ == "__main__":

    dataset = Dataset()
    dataset.import_df(rand=True)
    dataset.createTestData(100)

    DS = np.array(dataset.get2D())
    RD = np.array(dataset.results())

    ft = FeatureSelector(DS, RD, dataset.get2DTest(), dataset.testResults())
    ft.select_model("dt")
    ft.train_and_test()
    param_dt = {
    'max_depth': [5, 10, 50, 100, 500, 1000],#[ 5, 8, 10, 12, 13, 14, 15, 16, 17, 18, 20], #2, 3, #30, 50, 60], #100, 500, 1000],
    'min_samples_leaf': [1,5,10,20,50, 100, 200, 500]#7, 8, 9, 10, 11, 12, 13, 14, 15, 17],#20, 50, 100, 500] #[1, 2, 1, 2, 5,
}
    ft.hyper_paramter_tuning(param_dt, "Grid")
    ft.test_tuned_results()

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
        'max_depth': [5, 10, 50, 100, 500, 1000],
        # [ 5, 8, 10, 12, 13, 14, 15, 16, 17, 18, 20], #2, 3, #30, 50, 60], #100, 500, 1000],
        'min_samples_leaf': [1, 5, 10, 20, 50, 100, 200, 500]  #
        # 'max_depth': [2, 3, 5, 10, 20, 100, 500, 1000],
        # 'min_samples_leaf': [1, 2, 5, 10, 20, 50, 100, 500]
    }
    ft.hyper_paramter_tuning(param_rf, "Grid")

    ft.test_tuned_results()
