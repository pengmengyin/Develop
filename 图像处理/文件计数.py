import os

outer_path = './dataset-2/'
folderlist = os.listdir(outer_path)  # 列举文件夹
total_num_folder = len(folderlist)  # 文件夹的总数
a=[]
for folder in folderlist:
    inner_path = os.path.join(outer_path, folder)
    filelist = os.listdir(inner_path)  # 列举图片
    i = 0
    for item in filelist:
        i+=1
    a.append(i)
print(a)