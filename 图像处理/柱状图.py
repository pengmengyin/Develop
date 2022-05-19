# -*- coding: utf-8 -*-
import matplotlib.pyplot as plt
import numpy as np

#name_list = ['1','2','3','4','5','6','7','huagangyan','huichangyan','huishiyan','huoshanrongyan','huoshansuishiyan','huoshanyan','jiecenghuiyan','jinboliyan','juanyunmuqianzhangyan','liangjinshengwuhuiyan','liuhuawukuangshi','liyan','meikuang','nijinhuiyan','nizhihuiyan','nvnishipianyan','pianmayan','putaozhuanghuiyan','shanchangyan','shanhuhuiyan','shengwuhuiyan','shewenshi','shewenshihuadaliyan','shiyingyan','suishiguizhiyan','tiekuangshi','tiezhishi','tiezhixishayan','xilishiyingshayan','xuanwuyan','yeyan','zhengchangyan','zhenzhuyan','zisha']
name_list = ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41']
#num_list=[74, 21, 67, 55, 26, 51, 30, 72, 20, 26, 32, 40, 65, 53, 21, 50, 17, 48, 21, 56, 57, 50, 43, 40, 32, 35, 50, 54, 53, 50, 56, 55, 50, 50, 21, 21, 68, 61, 23, 76, 66]
#num_list = [60, 17, 54, 44, 21, 41, 24, 58, 16, 21, 26, 32, 52, 43, 17, 40, 51, 14, 39, 45, 46, 40, 35, 32, 26, 28, 40, 44, 43, 40, 45, 44, 40, 40, 17, 17, 55, 49, 19, 61, 53]
num_list1 =[54, 62, 54, 56, 78, 54, 60, 66, 60, 78, 66, 78, 66, 78, 61, 60, 51, 60, 63, 72, 66, 66, 54, 72, 66, 60, 60, 54, 54, 60, 60, 60, 60, 60, 63, 63, 66, 66, 69, 60, 60]
num_list=[211, 212, 183, 157, 156, 153, 180, 209, 180, 214, 192, 200, 184, 159, 183, 150, 153, 144, 189, 160, 170, 150, 223, 227, 192, 210, 150, 162, 159, 150, 166, 165, 150, 150, 189, 189, 192, 165, 220, 214, 186]
x = list(range(len(num_list)))
total_width, n = 0.6, 2
width = total_width / n

plt.bar(x, num_list, width=width, label='train', fc='y')
for i in range(len(x)):
    x[i] = x[i] + width
plt.bar(x, num_list1, width=width, label='test', tick_label=name_list, fc='r')

index=np.arange(len(name_list))

for a,b in zip(index,num_list):   #柱子上的数字显示
 plt.text(a,b,'%d'%b,ha='center',va='bottom',fontsize=10)
for a,b in zip(index+width,num_list1):
 plt.text(a,b,'%d'%b,ha='center',va='bottom',fontsize=10)

plt.xticks(fontsize=10)
plt.xticks(x, name_list, rotation=-60)
plt.legend()
plt.figure(num = 1,figsize=(30, 10))
plt.savefig("./pic/dataset.jpg", dpi=300)
plt.show()


