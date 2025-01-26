import numpy as np
import matplotlib.pyplot as plt
import random
from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import chi2
import pandas as pd
from sklearn import tree
from sklearn.ensemble import RandomForestClassifier
import copy
import Functions.Datasynthetising
from Functions.featureselection import  FeatureSelector

from random import randrange
import csv

class Dataset():
    dataset = []
    result = []
    testdata =  []
    testresults = []
    l_batt_dec = []

    def get(self):
        return self.dataset

    def results(self):
        return self.result

    def testResults(self):
        return self.testresults

    def get2D(self):
        data2D = []

        for i in range(len(self.dataset)):
            oneDData = []
            for j,subtile in enumerate(self.dataset[i]):
                for k, subsubtile in enumerate(subtile):
                    for l, point in enumerate(subsubtile):
                        oneDData.append(point)
            data2D.append(oneDData)

        return  data2D

    def get2DTest(self):
        data2D = []

        for i in range(len(self.testdata)):
            oneDData = []
            for j, subtile in enumerate(self.testdata[i]):
                for k, subsubtile in enumerate(subtile):
                    for l, point in enumerate(subsubtile):
                        oneDData.append(point)
            data2D.append(oneDData)

        return data2D

    def createTestData(self, size):
        for i in range(size):
            j = len(self.dataset)+i-size
            self.testdata.append((self.dataset[j]))
            self.testresults.append((self.result[j]))
            del self.dataset[j]
            del self.result[j]


        # Zufall:
        #for i in range(size):
        #    j = random.randint(0, len(self.dataset)-1)
        #    self.testdata.append((self.dataset[j]))
        #    self.testresults.append((self.result[j]))
        #    del self.dataset[j]
        #    del self.result[j]


    def addTile(self,tile,is_working):
        self.dataset.append(tile)
        self.result.append(is_working)

    def addTileFromRow(self, row, is_working):
        tile = self.createZeroTile()
        for i, subtile in enumerate(tile):
            for j, subsubtile in enumerate(subtile):
                for k, point in enumerate(subsubtile):
                    tile[i, j, k] = row[i*45+j*9+k]
        self.addTile(tile,is_working)

    def extract_df(self):
        l_moduls = np.arange(0,12,1).tolist()
        l_mp = np.arange(1,46,1).tolist()
        l_names = []
        for k in range(len(l_moduls)):
            for j in range(len(l_mp)):
                l_names.append("Mod_"+str(l_moduls[k])+"_Meas_"+str(l_mp[j]))
        data = []
        for i in range(len(self.dataset)):
            data.append(self.dataset[i].flatten().tolist())
        self.df = pd.DataFrame(data, columns=l_names)
        self.df["label"] = self.result
        self.df.to_csv(".//Data//extracted_random_data_v1.csv",  index=False)

    def import_df(self, rand = None):
#        file = open('.//Data//extracted_random_data_v1.csv')
        if rand:
            file = pd.read_csv('.//Data//extracted_random_data_v1.csv')
        else:
            file = pd.read_csv('.//Data//extracted_mego_augemnted.csv')
        #file = pd.read_csv('.//Data//extracted_random_data_v1.csv')
        #file = pd.read_csv('.//Data//extracted_mego_data_v1.csv')

        #file = pd.read_csv('.//Data//extracted_random_data_v1.csv')
        #file = pd.read_csv('.//Data//extracted_mego_data_v1.csv')
        csvreader = file.iloc[:,:file.shape[1]-1].copy()#csv.reader(file)
        self.df_labels = file["label"].copy()
        self.dataset = []
        count = 0
        for index, row in csvreader.iterrows():
#        for row in csvreader:
            if count == 0:
                print(row)
            else:
                data_row = row
                is_working = False
                self.addTileFromRow(data_row,self.df_labels.get(index))
            count +=1




    def addTileFromXLSX(self,path,is_working):
        tile = self.createZeroTile()
        df = pd.read_excel(path)

        columns = ["RPS_1_X",
        "RPS_2_X",
        "RPS_3_X",
        "RPS_4_X",
        "RPS_1_Y",
        "RPS_2_Y",
        "RPS_3_Y",
        "RPS_4_Y",
        "RPS_1_Z",
        "RPS_2_Z",
        "RPS_3_Z",
        "RPS_4_Z",
        "Boden_1_Segment_1_Z",
        "Boden_1_Segment_2_Z",
        "Boden_1_Segment_3_Z",
        "Boden_1_Segment_4_Z",
        "Boden_1_Segment_5_Z",
        "Boden_1_Segment_6_Z",
        "Boden_1_Segment_7_Z",
        "Boden_1_Segment_8_Z",
        "Boden_1_Segment_9_Z",
        "Boden_1_Segment_10_Z",
        "Boden_1_Segment_11_Z",
        "Boden_1_Segment_12_Z",
        "Boden_1_Segment_13_Z",
        "Boden_1_Segment_14_Z",
        "Boden_1_Segment_15_Z",
        "Boden_1_Segment_16_Z",
        "Boden_1_Segment_17_Z",
        "Boden_1_Segment_18_Z",
        "Boden_1_Segment_19_Z",
        "Boden_1_Segment_20_Z",
        "Boden_1_Segment_21_Z",
        "Boden_1_Segment_22_Z",
        "Boden_1_Segment_23_Z",
        "Boden_1_Segment_24_Z",
        "Boden_1_Segment_25_Z",
        "Boden_1_Segment_26_Z",
        "Boden_1_Segment_27_Z",
        "Boden_1_Segment_28_Z",
        "Boden_1_Segment_29_Z",
        "Boden_1_Segment_30_Z",
        "Boden_1_Segment_31_Z",
        "Boden_1_Segment_32_Z",
        "Boden_1_Segment_33_Z",
        "Boden_1_Segment_34_Z",
        "Boden_1_Segment_35_Z"]

        startfield=[[99,32],[99,16],[99,0],[103,32],[103,16],[103,0],[107,32],[107,16],[107,0],[111,32],[111,16],[111,0]]

        for t in range(12):
            for i in range(15):
                for j in range(3):
                    number = df.at[startfield[t][0]+j,columns[startfield[t][1]+i]]
                    tile[t,j,i] = number
        self.dataset.append(tile)
        self.result.append(is_working)



    def addTileFromXLSXSheet(self,path,is_working,sheet_name):
        tile = self.getTileFromXLSXSheet(path,sheet_name)
        self.dataset.append(tile)
        self.result.append(is_working)


    def getTileFromXLSXSheet(self,path,sheet_name):
        tile = self.createZeroTile()
        df = pd.read_excel(path,sheet_name)

        startfield=[[1,56],[11,56],[21,56],[1,62],[11,62],[21,62],[1,68],[11,68],[21,68],[1,74],[11,74],[21,74]]

        for t in range(12):
            for j in range(5):
                for i in range(9):
                    number = df.loc[startfield[t][1]+j,"Unnamed: " + str(startfield[t][0]+i)]
                    index = j*9+i
                    i2 = index % 15
                    j2 = int(index / 15)
                    tile[t,j,i] = number

        return tile

    def addSynthesisedTile(self,is_working):
        dec = 0
        if is_working: dec = 1
        self.l_batt_dec.append(dec)
        synth = Functions.Datasynthetising.SynthData()
        l_batt_ebenheit = synth.generateEbenheit(dec)
        synth.get_df()
        tile = synth.generateallModul(l_batt_ebenheit)
        print(l_batt_ebenheit)
        self.dataset.append(tile)

        appender = True
        for subtile in tile:
            # subtile = tile[0+i*45:45+i*45]
            maxi = np.max(subtile)
            mini = np.min(subtile)
            ebenheit = maxi - mini

            if ebenheit > 0.8:
                appender = False

        if appender != is_working:
            print("attention")

        for subtile in tile:
            # subtile = tile[0+i*45:45+i*45]
            maxi = np.max(subtile)
            mini = np.min(subtile)
            ebenheit = maxi - mini

            if ebenheit > 0.8:
                appender = False


        self.result.append(is_working)

    def getTile(self,i):
        return self.dataset[i]

    def createZeroTile(self):
        tile = np.zeros([12, 5, 9])
        return tile

    def createRandomTile(self):
        tile = self.createZeroTile()
        for i, subtile in enumerate(tile):
            for j, subsubtile in enumerate(subtile):
                for k, point in enumerate(subsubtile):
                    # if i < 1:
                    # dataset[i, j, k] = 0
                    # elif i == 1:
                    # dataset[i, j, k] = 0.5
                    # else:
                    tile[i, j, k] = random.random()
        return tile

    def plotRahmen(self,tile):
        fig, axs = plt.subplots(4, 3)

        for i, ax in enumerate(axs):
            for j, a in enumerate(ax):
                a.imshow(tile[j + i * 3], vmin=-1, vmax=1)
                a.axis('off')

        # plt.colorbar()
        plt.show()

    def plotFeature(self, tile):
        fig, axs = plt.subplots(4, 3)

        for i, ax in enumerate(axs):
            for j, a in enumerate(ax):
                a.imshow(tile[j + i * 3], vmin=-1, vmax=1)
                a.axis('off')

        # plt.colorbar()
        plt.show()

    def plotRahmenAsLineMatrix(self, tile):
        fig, axs = plt.subplots(4, 3)

        for i, ax in enumerate(axs):
            for j, a in enumerate(ax):
                fach = tile[j + i * 3]
                #fach = fach.reshape((45))
                a.axvline(14.5, color='k')
                a.set_ylim([-1, 1])
                a.axvline(29.5, color='k')
                a.plot(range(0,15),fach[0])
                a.plot(range(15,30),fach[1])
                a.plot(range(30,45),fach[2])
                #a.axis('off')

        # plt.colorbar()
        plt.show()




    def plotMultiRahmenAsLineMatrix(self, tiles):
        fig, axs = plt.subplots(4, 3)

        for tile in tiles:
            for i, ax in enumerate(axs):
                for j, a in enumerate(ax):
                    fach = tile[j + i * 3]
                    # fach = fach.reshape((45))

                    tilenr = 0

                    a.axvline(8.5 + (tilenr * 45), color='k', linewidth=0.2)
                    a.axvline(17.5 + (tilenr * 45), color='k', linewidth=0.2)
                    a.axvline(26.5 + (tilenr * 45), color='k', linewidth=0.2)
                    a.axvline(35.5 + (tilenr * 45), color='k', linewidth=0.2)
                    #a.axvline(44.5 + (tilenr * 45), color='k')
                    a.plot(range(0 + (tilenr * 45), 9 + (tilenr * 45)), fach[0])
                    a.plot(range(9 + (tilenr * 45), 18 + (tilenr * 45)), fach[1])
                    a.plot(range(18 + (tilenr * 45), 27 + (tilenr * 45)), fach[2])
                    a.plot(range(27 + (tilenr * 45), 36 + (tilenr * 45)), fach[3])
                    a.plot(range(36 + (tilenr * 45), 45 + (tilenr * 45)), fach[4])
                    # a.axis('off')

        # plt.colorbar()
        plt.show()

    def plotRahmenAsLine(self, tile):
        a = plt

        a.ylim([-1, 1])
        a.axvline(0, color='k')
        for tilenr in range(12):
                fach = tile[tilenr]
                # fach = fach.reshape((45))
                a.axvline(8.5 + (tilenr * 45), color='k', linewidth=0.2)
                a.axvline(17.5 + (tilenr * 45), color='k', linewidth=0.2)
                a.axvline(26.5 + (tilenr * 45), color='k', linewidth=0.2)
                a.axvline(35.5 + (tilenr * 45), color='k', linewidth=0.2)
                a.axvline(44.5 + (tilenr * 45), color='k')
                a.plot(range(0 + (tilenr * 45), 9 + (tilenr * 45)), fach[0])
                a.plot(range(9 + (tilenr * 45), 18 + (tilenr * 45)), fach[1])
                a.plot(range(18 + (tilenr * 45), 27 + (tilenr * 45)), fach[2])
                a.plot(range(27 + (tilenr * 45), 36 + (tilenr * 45)), fach[3])
                a.plot(range(36 + (tilenr * 45), 45 + (tilenr * 45)), fach[4])

        #a.axis('off')

        # plt.colorbar()
        plt.show()

    def plotMultiRahmenAsLine(self, tiles):
        fig, axs = plt.subplots(len(tiles))

        for i,a in enumerate(axs):
            a.set_ylim([-1, 1])
            a.axvline(0, color='k')
            for tilenr in range(12):
                    fach = tiles[i][tilenr]
                    #fach = fach.reshape((45))
                    a.axvline(8.5+(tilenr*45), color='k',linewidth=0.2)
                    a.axvline(17.5+(tilenr*45), color='k',linewidth=0.2)
                    a.axvline(26.5 + (tilenr * 45), color='k', linewidth=0.2)
                    a.axvline(35.5 + (tilenr * 45), color='k', linewidth=0.2)
                    a.axvline(44.5 + (tilenr * 45), color='k')
                    a.plot(range(0+(tilenr*45),9+(tilenr*45)),fach[0])
                    a.plot(range(9+(tilenr*45),18+(tilenr*45)),fach[1])
                    a.plot(range(18+(tilenr*45),27+(tilenr*45)),fach[2])
                    a.plot(range(27 + (tilenr * 45), 36 + (tilenr * 45)), fach[3])
                    a.plot(range(36 + (tilenr * 45), 45 + (tilenr * 45)), fach[4])

                #a.axis('off')

        # plt.colorbar()
        plt.show()

    def plotRahmenAs3D(self, tile):
            ax = plt.axes(projection='3d')
            #ax.set_ylim([-1, 1])
            for i in range(4):
                for j in range(3):
                    fach = tile[j + i * 3]
                    #fach = fach.reshape((45))
                    #ax.axvline(14.5, color='k')
                    #ax.axvline(29.5, color='k')
                    X = np.arange(0+j*3, 3+j*3, 1)
                    Y = np.arange(0+i*15, 15+i*15, 1)
                    X_fach = np.arange(0, 3, 1)
                    Y_fach = np.arange(0, 15, 1)
                    X, Y = np.meshgrid(X, Y)
                    X_fach, Y_fach = np.meshgrid(X_fach, Y_fach)
                    Z = fach[X_fach,Y_fach]

                    ax.plot_surface(X,Y,Z)

                    #a.axis('off')

            # plt.colorbar()
            ax.set_zlim([-1, 1])
            plt.show()


    def predictwithebenheit(self):
        data = self.dataset
        labellist = []
        for tile in data:
            appender = 1
            for subtile in tile:
                #subtile = tile[0+i*45:45+i*45]
                maxi = np.max(subtile)
                mini = np.min(subtile)
                ebenheit = maxi - mini

                if ebenheit>0.8:
                    appender = 0
            labellist.append(appender)
        self.result = labellist

    def transformX(self,X,features):
        X_hat = []
        for x in X:
            x_hat = []
            for i,element in enumerate(x):
                if i in features:
                    x_hat.append(element)
            X_hat.append(x_hat)
        return X_hat




