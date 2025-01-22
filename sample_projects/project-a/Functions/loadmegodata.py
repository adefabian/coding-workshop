import csv
import numpy as np
import matplotlib.pyplot as plt
import numpy as np
from sklearn.preprocessing import MinMaxScaler
#from open3d import *
import pandas as pd
def findclosest(x_p,y_p,pointlist):
    #points = np.array(pointlist)
    #points_x = np.array(pointlist)[:,0]
    #points_y = np.array(pointlist)[:, 1]
    #x = points_x[(np.abs(points_x - x_p)).argmin()]
    #y = points_y[(np.abs(points_y - y_p)).argmin()]

    return_val = 0
    distance = 10000.0
    index = 0
    for indx,point in enumerate(pointlist):

        distance_temp = np.abs(point[0]-x_p)+np.abs(point[1]-y_p)
        if distance_temp < distance:
            return_val = point[2]
            distance = distance_temp
            index = indx


    print(index)
    return return_val


    print(x,y)

def plotRahmen(tile, vmi = -1, vma = 1, batteriename = None):
        fig, axs = plt.subplots(4, 3)

        for i, ax in enumerate(axs):
            for j, a in enumerate(ax):
                a.imshow(tile[j + i * 3], vmin=vmi, vmax=vma)
                a.axis('off')

        # plt.colorbar()
        plt.show()
def find_fach(n):
    df_ext = df[df["'Element'"].str.startswith("' Fach 0"+str(n)+"_")]
    min_x = np.min(df_ext[df_ext["'Property'"]=="'X'"]["'Dev'"])
    max_x = np.max(df_ext[df_ext["'Property'"]=="'X'"]["'Dev'"])
    min_y = np.min(df_ext[df_ext["'Property'"]=="'Y'"]["'Dev'"])
    max_y = np.max(df_ext[df_ext["'Property'"]=="'Y'"]["'Dev'"])

def minmax_scaling(input_array):
    scaler = MinMaxScaler()
    scaled_data = scaler.fit_transform(input_array)
    return scaled_data

if __name__ == "__main__":
    str = 'hi'
    l_names = ["278", "444", "447", "451","481", "497", "500", "505", "507", "510", "513", "517"]
    for id_h in range(len(l_names)):
        file = open('.//me-go Data/THL_'+l_names[id_h]+'_Koordinaten.csv')
        csvreader = csv.reader(file,delimiter='\t')
    #    df = pd.read_csv('.//me-go Data/THL_278_Koordinaten.csv', sep="  ")
        pointlist = []
        point =[]
        edgepoints = []

        idxlist_f1 = [0,45,782,827]
        idxlist_f2 = [2484,2539,5220,5275]
        idxlist_f3 = [5277, 5328, 7956, 8007]
        idxlist_f4 = [8010, 8061, 10440, 10491]
        idxlist_f5 = [10494, 10548, 13230, 13284]
        idxlist_f6 = [13287, 13341, 16026, 16077]
        idxlist_f7 = [16080, 16131, 18591, 18645]
        idxlist_f8 = [18648, 18702, 21381, 21435]
        idxlist_f9 = [21438, 21489, 24147, 24195]
        idxlist_f10 = [24198, 24249, 26628, 26679]
        idxlist_f11 = [26682, 26736, 29418, 29472]
        idxlist_f12 = [29475, 29529, 32211, 32265]
        idxlist= idxlist_f1 + idxlist_f2 + idxlist_f3 + idxlist_f4 + idxlist_f5 + idxlist_f6+ idxlist_f7 + idxlist_f8 +  idxlist_f9 + idxlist_f10+ idxlist_f11 + idxlist_f12

        for index,row in enumerate(csvreader):
            if index > 0:
                try:
                    val = float(row[4].replace(',', '.'))
                except:
                    val = 1000
                #print(val)
                point.append(val)
                if index % 3 == 0:
                    i = len(pointlist)
                    if i in idxlist:
                        edgepoints.append(point)

                    pointlist.append(point)
                    point = []

        tile = np.zeros([12, 5, 9])
        for k in range(0,12):



            m = 9
            n = 5
            x =[]
            y=[]
            epoints = np.array(edgepoints[k:k+4])
            width = epoints[1,0]-epoints[0,0]
            height = epoints[0,1]-epoints[2,1]

            for i in range(m):
                for j in range(n):
                    x_p = epoints[0][0] + width / m * i
                    y_p = epoints[0][1] - height / n * j
                    x.append(epoints[0][0] + width/m*i)
                    y.append(epoints[0][1] + height/n*j)

                    tile[k,j,i] = findclosest(x_p,y_p,pointlist)







            #plt.axis('off')

    # plt.colorbar()

        # plt.imshow(tile[0],vmax=310,vmin=309)
        # plotRahmen(tile)
        # plt.show()
        batteriename = "THL_"+l_names[id_h]
        scal_shaped_tile = minmax_scaling(tile.reshape(-1, 1))
        scaled_reshaped_tile = scal_shaped_tile.reshape(12, 5, 9)
        #plotRahmen(scaled_reshaped_tile, batteriename=batteriename)
        # plt.suptitle(batteriename)
        # plt.show()
        nppoints = np.array(edgepoints)
        #x = nppoints[:, 0]
        #y = nppoints[:, 1]
        # plt.scatter(x, y)
        #
        # plt.show()
        print(pointlist)

        #tile_r = tile.reshape(12, 5, 9)
        if l_names[id_h] == "278":
            tile_r = np.delete(scaled_reshaped_tile, [4,5], 0)#.shape
            scaled_reshaped_tile[4,:,:] = np.zeros((5,9))
            scaled_reshaped_tile[5, :, :] = np.zeros((5, 9))
        elif l_names[id_h] == "444":
            tile_r = np.delete(scaled_reshaped_tile, [5,6,8,9,10], 0)#.shape
            scaled_reshaped_tile[5,:,:] = np.zeros((5,9))
            scaled_reshaped_tile[6, :, :] = np.zeros((5, 9))
            scaled_reshaped_tile[8,:,:] = np.zeros((5,9))
            scaled_reshaped_tile[9, :, :] = np.zeros((5, 9))
            scaled_reshaped_tile[10,:,:] = np.zeros((5,9))
        else:
            tile_r = scaled_reshaped_tile

        if id_h == 0:
            all_tiles = tile_r
        else:
            all_tiles = np.concatenate((all_tiles, tile_r), axis = 0)
        plotRahmen(scaled_reshaped_tile)
        plt.suptitle(batteriename)
        plt.show()
    np.save("./Data/me-goData", all_tiles)

  #      plotRahmen(tile)



