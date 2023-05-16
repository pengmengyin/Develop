from PIL import Image
# !/usr/bin/python
# -*- coding:utf-8 -*-
import os
from torchvision.transforms import transforms
outer_path = './images/'
folderlist = os.listdir(outer_path)  # 列举文件夹
def mkfile(file):
    if not os.path.exists(file):
        os.makedirs(file)
flower_class = [cla for cla in os.listdir(outer_path) if ".txt" not in cla]
for cla in flower_class:
   mkfile('images-1/'+cla)

img_size = {"s": [300, 384],  # train_size, val_size
                "m": [384, 480],
                "l": [384, 480]}
num_model = "s"
for folder in folderlist:
    inner_path = os.path.join(outer_path, folder)
    total_num_folder = len(folderlist)  # 文件夹的总数
    print('total have %d folders' % (total_num_folder))  # 打印文件夹的总数

    filelist = os.listdir(inner_path)  # 列举图片
    i = 1
    for item in filelist:
        img = Image.open('./images/'+folder+'/'+item)
        #img1=transforms.RandomRotation(90)(img)
        #img1=transforms.RandomResizedCrop(img_size[num_model][0])(img)
        img1 = transforms.Resize(img_size[num_model][0])(img)
       # img1.save('./images-1/' +folder +'/'+ str(i) + '.png')
        img1.save('./images-1/' + folder +'/' +item)

        i+=1


