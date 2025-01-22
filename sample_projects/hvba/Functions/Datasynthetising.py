import numpy as np
import matplotlib.pyplot as plt
import random
from random import randrange
from random import randint
import pandas as pd
import copy
import Functions.createdataset

class SynthData():
    tile1 = None

    def startsynth(self):
        self.get_df()
        self.l_batt_dec = []
        for i in range(500):
            self.batt_dec = self.selectdec()
            self.l_batt_ebenheit = self.generateEbenheit(self.batt_dec)
            self.l_batt_dec.append(self.batt_dec)
            self.generateallModul(self.l_batt_ebenheit)
        self.df["label"] = self.l_batt_dec

    def selectdec(self):
        return randrange(2)

    def generateEbenheit(self, dec):
        l_ebenheits = []
        if dec == 1: # I.O
            for i in range(12): # generate 12 ebenheit < 0.8
                l_ebenheits.append(random.uniform(0, 0.8))
        else:
            n_n_i_o = 1#random.randint(1,12) #n_i_o
            #print(n_n_i_o)
            l_n_i_o_ebenheit = [0]#random.sample(range(0, 12), n_n_i_o)
            #print(l_n_i_o_ebenheit)
            for i in range(12):
                if i in l_n_i_o_ebenheit:
                    l_ebenheits.append(random.uniform(0.8, 1))
                else:
                    l_ebenheits.append(random.uniform(0, 0.8))
        return  l_ebenheits

    def generateallModul(self,l_batt_ebenheit):
        self.dataset_to_f = []
        arr_dataset = []
        for i in range(len(l_batt_ebenheit)):
            dec =1# randrange(3)

            if dec == 0:
                self.arr_modul = self.generatePolynom(l_batt_ebenheit[i])
            elif dec == 1:
                self.arr_modul = self.generateFachDA(l_batt_ebenheit[i])
            else:
                self.arr_modul = self.generateFachGradient(l_batt_ebenheit[i])

            arr_dataset.append(self.arr_modul)
            self.dataset_to_f.append(self.arr_modul.flatten().tolist())
        self.dataset = [item for sublist in self.dataset_to_f for item in sublist]
        self.df.loc[len(self.df) + 1] = self.dataset
        return np.asarray(arr_dataset)


    def get_df(self):
        l_moduls = np.arange(0,12,1).tolist()
        l_x = np.arange(5).tolist()
        l_y = np.arange(9).tolist()
        l_names = []
        for k in range(len(l_moduls)):
            for x in l_x:
                for y in l_y:
                    l_names.append("Mod_"+str(l_moduls[k])+"_X_"+str(x)+"_Y_"+str(y))
        # data = []
        # for i in range(len(self.dataset)):
        #     data.append(self.dataset[i].flatten().tolist())
        self.df = pd.DataFrame([], columns=l_names)
 #       self.df.to_csv(".//Data//extracted_random_data.csv",  index=False)

    def generateFachGradient(self, ebenheit):

        z_mean_max = 1 - ebenheit / 2
        z_mean_min = -1 + ebenheit / 2

        z_mean = random.uniform(z_mean_min, z_mean_max)
        fach = np.empty((5, 9))

        z_min = z_mean - ebenheit / 2
        z_max = z_mean + ebenheit / 2

        stepsize = ebenheit / (len(fach) - 1)

        for i, row in enumerate(fach):
            for j, element in enumerate(row):
                fach[i, j] = z_min + stepsize * i

        fach = self.mirrorx(fach)

        return fach

    def generateFachDA(self, ebenheit):
        dataset = createdataset.Dataset()
        if self.tile1 is None:
            self.tile1 = dataset.getTileFromXLSXSheet("Data/PPE41_Ebenheitsauswertung_EWL3.xlsx", "THL280")
            self.tile2 = dataset.getTileFromXLSXSheet("Data/PPE41_Ebenheitsauswertung_EWL3.xlsx", "THL279")
            self.tile3 = np.load("./Data/me-goData.npy")

        ebenheitlist = np.empty(161)
        for i, fach in enumerate(self.tile1):
            min = fach.min()
            max = fach.max()
            ebenheit_temp = max - min
            ebenheitlist[i] = ebenheit_temp
        for i, fach in enumerate(self.tile2):
            min = fach.min()
            max = fach.max()
            ebenheit_temp = max - min
            ebenheitlist[i + 12] = ebenheit_temp
        for i, fach in enumerate(self.tile3):
            min = fach.min()
            max = fach.max()
            ebenheit_temp = max - min
            ebenheitlist[i + 24] = ebenheit_temp

        idx = (np.abs(ebenheitlist - ebenheit)).argmin()
        if ebenheitlist[idx] > 0.8 and ebenheit < 0.8:
            ebenheit = ebenheit - 0.1
            idx = (np.abs(ebenheitlist - ebenheit)).argmin()
            print("false")
        if ebenheitlist[idx] < 0.8 and ebenheit > 0.8:
            ebenheit = ebenheit + 0.1
            idx = (np.abs(ebenheitlist - ebenheit)).argmin()
            print("false")

        if (idx < 12):
            fach = self.tile1[idx]
        elif (idx < 24) and (idx > 11):
            fach = self.tile2[idx - 12]
        else:
            fach = self.tile3[idx-24]
        fach = self.dataaugment(fach)
        return fach

    def dataaugment(self, fach):

        mirrorx = random.randint(0, 1)
        if mirrorx == 1:
            fach = self.mirrorx(fach)

        mirrory = random.randint(0, 1)
        if mirrory == 1:
            fach = self.mirrory(fach)

        fach = self.zlift(fach)

        return fach

    def mirrory(self, fach):
        fach_mirrored = copy.deepcopy(fach)
        for i in range(len(fach)):
            for j in range(len(fach[0])):
                k = len(fach) - i - 1
                fach_mirrored[i, j] = fach[k, j]
        return fach_mirrored

    def mirrorx(self, fach):
        fach_mirrored = copy.deepcopy(fach)
        for i in range(len(fach)):
            for j in range(len(fach[0])):
                k = len(fach[0]) - j - 1
                fach_mirrored[i, j] = fach[i, k]
        return fach_mirrored

    def zlift(self, fach):
        fach_lifted = fach
        max = fach.max()
        min = fach.min()

        z_add_max = 1 - max
        z_add_min = -1 - min
        z_add = random.uniform(z_add_min, z_add_max)

        fach_lifted = fach + z_add
        return fach_lifted

    def generatePolynom(self, ebenheit):
        fach = np.zeros((5,9))
        all_x = np.arange(5)
        all_y = np.arange(9)
        a = 1/randint(10,50)
        dec = randrange(2)
        if dec == 0:
            b = 1 / randint(10, 50)
        else:
            b = -random.uniform(7, 10)*a
        c = 1 / randint(10, 150)
        dec = randrange(2)
        if dec == 0:
            d = 1 / randint(50, 100)
        else:
            d = -random.uniform(3, 6)*c
        e = random.random()
        l_poly = []
        for x in all_x:
            for y in all_y:
                z = a*x*x+b*x+c*y*y+d*y +e
                fach[x, y] = z
                l_poly.append(z)
        maxi = np.max(l_poly)
        mini = np.min(l_poly)
        maxi = maxi - mini
        # for i in range(len(l_poly)):
        #     l_poly[i] = (2/maxi)*l_poly[i] -1

        for x in all_x:
            for y in all_y:
                fach[x,y] = (ebenheit/maxi) * fach[x,y] - 0.5

        ebenheit_calc = np.max(fach) - np.min(fach)
        if ebenheit != ebenheit_calc:
            print(ebenheit_calc-ebenheit)
        return fach




if __name__ == "__main__":
    syn = SynthData()
    syn.startsynth()
