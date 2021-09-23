# !/usr/bin/env python
    # coding: utf-8
import socket
import threading
import matplotlib.pyplot as plt

import tensorflow as tf
config = tf.compat.v1.ConfigProto()
config.gpu_options.allow_growth = True
session = tf.compat.v1.InteractiveSession(config=config)
from PIL import Image
import numpy as np
import cv2
import json
from model import vgg
def main():
    # 创建服务器套接字
    serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # 获取本地主机名称
    host = socket.gethostname()
    # 设置一个端口
    port = 12345
    # 将套接字与本地主机和端口绑定
    serversocket.bind((host, port))
    # 设置监听最大连接数
    serversocket.listen(5)
    # 获取本地服务器的连接信息
    myaddr = serversocket.getsockname()
    print("服务器地址:%s" % str(myaddr))
    # 循环等待接受客户端信息
    while True:
        # 获取一个客户端连接
        clientsocket, addr = serversocket.accept()
        print("连接地址:%s" % str(addr))
        try:
            t = ServerThreading(clientsocket)  # 为每一个请求开启一个处理线程
            t.start()
            pass
        except Exception as identifier:
            print(identifier)
            pass
        pass
    serversocket.close()
    pass

# 计算光影背景
def calculateLightPattern(img4):
    h, w = img4.shape[0], img4.shape[1]
    img5 = cv2.blur(img4, (int(w / 3), int(w / 3)))
    return img5


# 移除背景
def removeLight(img4, img5, method):
    if method == 1:
        img4_32 = np.float32(img4)
        img5_32 = np.float32(img5)
        ratio = img4_32 / img5_32
        ratio[ratio > 1] = 1
        aux = 1 - ratio

        # 按比例转换为8bit格式
        aux = aux * 255
        aux = np.uint8(aux)
    else:
        aux = img5 - img4
    return aux

def FindContours(aux):
    contours, hierarchy = cv2.findContours(aux, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    if len(contours) == 0:
        print("未检测到")
        return
    else:
        print("检测数量为:", len(contours))

    output = np.zeros((aux.shape[0], aux.shape[1], 3), np.uint8)
    for i in range(len(contours)):
        cv2.drawContours(
            output,
            contours,
            i,
            (np.random.randint(0, 255),
             np.random.randint(0, 255),
             np.random.randint(0, 255)), 2)
    #return output
    return len(contours)

class ServerThreading(threading.Thread):
    # words = text2vec.load_lexicon()
    def __init__(self, clientsocket, recvsize=1024 * 1024, encoding="utf-8"):
        threading.Thread.__init__(self)
        self._socket = clientsocket
        self._recvsize = recvsize
        self._encoding = encoding
        pass

    def run(self):
        print("开启线程.....")
        try:


            # 接受数据
            msg = ''
            while True:
                # 读取recvsize个字节
                rec = self._socket.recv(self._recvsize)
                # 解码
                msg += rec.decode(self._encoding)
                # 文本接受是否完毕，因为python socket不能自己判断接收数据是否完毕，
                # 所以需要自定义协议标志数据接受完毕
                if msg.strip().endswith('over'):
                    msg = msg[:-4]
                    break
            # 解析json格式的数据
            re = json.loads(msg)
            # 调用神经网络模型处理请求
            a=str(re["img"])
            # In[3]:

            im_height = 56
            im_width = 56

            # load image
            # 通过img库的open函数打开图片
            #b="rock_data/ver/"+a+".jpg"
            b= "D:/"+a+".jpg"
#

            # 读取图片
            img = cv2.imread(b, 0)
            pre_img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)  # 二值化函数

            # 第一步：中值滤波
            # 中值滤波
            img1 = cv2.medianBlur(img, 3)

            cv2.imwrite('medianBlur.jpg', img1)
            # 第二步：图像二值化
            # 图像二值化
            ret, img2 = cv2.threshold(img1, 140, 255, 0, img1)  # 二值化函数

            # 显示并保存图片
            cv2.imwrite('threshold.jpg', img2)

            # 第三步：膨胀图像
            dilate_kernel = np.ones((3, 3), np.uint8)
            img3 = cv2.dilate(img2, dilate_kernel)
            cv2.imwrite('dilate.jpg', img3)

            # 第四步：腐蚀图像
            # erode_kernel = np.ones((7, 7), np.uint8)
            erode_kernel = np.ones((40, 40), np.uint8)
            img4 = cv2.erode(img3, erode_kernel)

            cv2.imwrite('erode.jpg', img4)

            # 第五步：计算光影背景
            img5 = calculateLightPattern(img4)
            cv2.imwrite('LightPattern.jpg', img5)

            # 第六步：移除背景
            aux = removeLight(img4, img5, 1)
            cv2.imwrite('removeLight.jpg', aux)

            # 第七步：检测轮廓
            output3 = FindContours(aux)
#
            img = Image.open(b)

            # In[4]:

            # resize image to 224x224
            # 对图片进行resize处理，缩放到224*224的大小
            img = img.resize((im_width, im_height))


            # In[5]:

            # scaling pixel value to (0-1)
            # 将每个像素值的大小缩放到0-1之间
            img = np.array(img) / 255.

            # Add the image to a batch where it's the only member.
            # 扩充图片的维度，在最前面加上batch的维度，最后变为：[batch维度，图片宽度，图片高度，图片深度]
            img = (np.expand_dims(img, 0))

            # In[6]:

            # read class_indict
            try:
                # 读取之前保存好的json文件，也就是索引和类别相对应的文件
                json_file = open('./class_indices.json', 'r')
                class_indict = json.load(json_file)
            except Exception as e:
                print(e)
                exit(-1)

            # In[8]:

            # 实例化模型，
            model = vgg("vgg16", 56, 56, 15)
            # 通过weights函数载入模型
            model.load_weights("./save_weights/myVGG.ckpt")

            # In[10]:

            # model.predict(img)：将图片输入到模型中进行预测，得到结果得到的应该是batch维度的，所以需要对结果进行压缩，得到预测结果
            result = np.squeeze(model.predict(img))
            # np.argmax：通过这个函数获取概率最大的结果
            # 输出预测的类别和概率
            predict_class = np.argmax(result)
            predict_class1 =np.argpartition(result,-2)[-2]

            # 输出预测的类别和概率
            c=(class_indict[str(predict_class)], result[predict_class])
            d=(class_indict[str(predict_class1)], result[predict_class1])
            count=('检测数量',output3)
            count1=str(count)
            e=str(c)
            f=str(d)
            g=e+f+count1
            self._socket.send(g.encode(self._encoding))

            pass
        except Exception as identifier:
            self._socket.send("500".encode(self._encoding))
            print(identifier)
            pass
        finally:
            self._socket.close()
        print("任务结束.....")
        pass

    def __del__(self):

        pass
if __name__ == "__main__":
    main()