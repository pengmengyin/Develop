#!/user/bin/env python
# coding=utf-8
"""
@project : csdn
@author  : 剑客阿良_ALiang
@file   : draw_pic.py
@ide    : PyCharm
@time   : 2022-03-23 09:38:28
"""
import pandas as pd
from matplotlib import pyplot as plt

_dates = ['1', '2', '3', '4','5', '6', '7', '8',
          '9', '10','11','12','13','14','15','16',
          '17','18','19','20','21','22','23','24',
          '25','26','27','28','29','30','31','32',
          '33','34','35','36','37','38','39','40']
#_data1 = [4.024, 2.553,  2.353, 1.863, 1.665, 1.547, 1.388, 1.289, 1.199, 1.156 , 0.910,0.906,0.838,0.827,0.763,0.739,0.621, 0.695, 0.711, 0.677,0.648, 0.642, 0.596,0.541,0.566, 0.472, 0.432,0.532,0.440,   0.449,0.514,0.433,0.454,0.400,0.478,0.445,0.376,0.515,0.483,0.470] #train_loss
_data1 =[0.309, 0.518,  0.578, 0.649, 0.656, 0.680, 0.688, 0.740, 0.736, 0.741,  0.777, 0.783,0.779,0.782,0.801,0.803,0.828,0.816, 0.818, 0.807,0.839, 0.832,0.826,0.853,0.835,0.868,0.872, 0.851,  0.862,   0.861,0.851,0.870,0.872,0.882,0.848,0.878,0.876,0.851,0.856,0.872] #train_acc
#_data2 = [0.615, 0.480, 0.431, 0.217, 0.296, 0.261, 0.365, 0.265, 0.265, 0.226, 0.173, 0.200,0.125,0.127,0.238, 0.207, 0.203,0.163,0.154,0.194,0.208, 0.127, 0.144,0.170,0.166, 0.122,0.127,0.141,   0.166,   0.134,0.141,0.110,0.123,0.117,0.127,0.132,0.113,0.124,0.119, 0.132 ]   #val_loss
_data2 =[0.820, 0.871,  0.887, 0.932, 0.887, 0.920, 0.923, 0.929, 0.916, 0.932,0.955,0.952,0.942, 0.958,0.923,0.939,0.965, 0.971,0.961, 0.958,0.949,0.968,0.961,0.961,0.949,0.968,0.971,0.952,      0.949,   0.965,0.955,0.968,0.974,0.968,0.965,0.961,0.965,0.961,0.968,0.965] #val_acc
#di = pd.DatetimeIndex(_dates,
 #                     dtype='datetime64[ns]', freq=None)


#pd.DataFrame({'data1': _data1},
#             index=_dates).plot.line()  # 图形横坐标默认为数据索引index。




#plt.savefig(r'pic/p1.png', dpi=200)
#plt.show()  # 显示当前正在编译的图像

pd.DataFrame({'train_accuracy': _data1, 'val_accuracy': _data2},
             index=_dates).plot.line()  # 图形横坐标默认为数据索引index。
plt.xlabel("epochs")
plt.ylabel("accuracy")
#plt.xlabel("x")
#plt.ylabel("y")
plt.savefig(r'pic/accuracy.png', dpi=200)
plt.show()  # 显示当前正在编译的图像