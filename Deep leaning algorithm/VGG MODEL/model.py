#!/usr/bin/env python
# coding: utf-8

# In[2]:


from tensorflow.keras import layers, models, Model, Sequential


# In[1]:


def VGG(feature, im_height=56, im_width=56, class_num=1000):
    # tensorflow中的tensor通道排序是NHWC，shape：图片的高度和宽度，
    input_image = layers.Input(shape=(im_height, im_width, 3), dtype="float32")
    x = feature(input_image)
    #对输入数据进行展平处理，将多维的输入一维化，常用于从卷积层到全连接层的过渡
    x = layers.Flatten()(x)
    #将展平后的数据和全连接1层进行连接
    #使用dropout方法，rate=0.5将其中的50%的神经元进行随机失活，以达到一个防止过拟合的目的
    x = layers.Dropout(rate=0.5)(x)
    #Dense：创建一个全连接层
    x = layers.Dense(4096, activation='relu')(x)
    #在全连接层1和全连接层2之间再使用dropout函数
    x = layers.Dropout(rate=0.5)(x)
    x = layers.Dense(4096, activation='relu')(x)
    #最后一个全连接层，节点个数应该对应输出的类别个数，class_num：传入的一个参数，此模型分类的类别
    x = layers.Dense(class_num)(x)
    #通过softmax函数得到类别的一个概率分布
    output = layers.Softmax()(x)
    #通过models.Model 定义输入和输出
    model = models.Model(inputs=input_image, outputs=output)
    #最后创建好一个VGG模型
    return model

#生成提取特征网络结构
def features(cfg):#cfg：指定特定的一个列表
    #用来存储所定义的一系列操作
    feature_layers = []
    for v in cfg:
        if v == "M":
            #MaxPool2D：创建一个最大池化下采样层，池化核大小为2，步长为2
            feature_layers.append(layers.MaxPool2D(pool_size=2, strides=2))
        else:
            #Conv2D：定义卷积层，卷积操作
            #v：卷积核的个数  核大小：kernel_size = 3  SAME：输入和输出的特征层大小不会发生变化
            conv2d = layers.Conv2D(v, kernel_size=3, padding="SAME", activation="relu")
            feature_layers.append(conv2d)
            #Keras类提供的函数Sequential：生成提取特征网络结构   name：给提取特征网络结构命名为：feature
    return Sequential(feature_layers, name="feature")

#定义一个字典，存储四种配置的模型结构
cfgs = {
    'vgg11': [64, 'M', 128, 'M', 256, 256, 'M', 512, 512, 'M', 512, 512, 'M'],
    'vgg13': [64, 64, 'M', 128, 128, 'M', 256, 256, 'M', 512, 512, 'M', 512, 512, 'M'],
    'vgg16': [64, 64, 'M', 128, 128, 'M', 256, 256, 256, 'M', 512, 512, 512, 'M', 512, 512, 512, 'M'],
    'vgg19': [64, 64, 'M', 128, 128, 'M', 256, 256, 256, 256, 'M', 512, 512, 512, 512, 'M', 512, 512, 512, 512, 'M'],
}

#实例化VGG模型，传入字典的key，根据需要的配置传入相应的key值
def vgg(model_name="vgg16", im_height=224, im_width=224, class_num=5):
    try:
        #通过cfgs获取key值所对应的参数列表
        cfg = cfgs[model_name]
    except:
        print("Warning: model number {} not in cfgs dict!".format(model_name))
        exit(-1)
        #通过features(cfg)生成提取特征网络结构
    model = VGG(features(cfg), im_height=im_height, im_width=im_width, class_num=class_num)
    return model


# In[3]:





# In[ ]:




