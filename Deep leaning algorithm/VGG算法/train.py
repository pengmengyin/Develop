#!/usr/bin/env python
# coding: utf-8

# In[2]:


import matplotlib.pyplot as plt
import tensorflow as tf
import json
import os
import time
import glob
import random
import sys
import datetime

# In[3]:


# 保存输出文件
class Logger(object):
    def __init__(self, filename="Default.log"):
        self.terminal = sys.stdout
        self.log = open(filename, "a")

    def write(self, message):
        self.terminal.write(message)
        self.log.write(message)

    def flush(self):
        pass


path = os.path.abspath(os.path.dirname(__file__))
type = sys.getfilesystemencoding()
sys.stdout = Logger('Output log.txt')

print(path)
print(os.path.dirname(__file__))
print('------------------')



from model import vgg

# In[4]:


os.environ["CUDA_DEVICE_ORDER"] = "PCI_BUS_ID"
# 设置tensorflow只能发现哪几块GPU
# 设置的是0，只能看见当前设备的第一块GPU
os.environ["CUDA_VISIBLE_DEVICES"] = "0"





# In[5]:

config = tf.compat.v1.ConfigProto()
config.gpu_options.per_process_gpu_memory_fraction = 0.6
sess = tf.compat.v1.Session(config=config)


gpus = tf.config.experimental.list_physical_devices("GPU")
if gpus:
    try:
        for gpu in gpus:
            # 设置GPU的内存占用，根据模型的大小，来占用相对应的内存
            tf.config.experimental.set_memory_growth(gpu, True)
    except RuntimeError as e:
        print(e)
        exit(-1)

# In[9]:


# 定义训练集和验证集文件夹的位置
# data_root = os.path.abspath(os.path.join(os.getcwd(), "../.."))  # get data root path
image_path = "rock_data/"  # rock data set path
train_dir = image_path + "train"
validation_dir = image_path + "val"

# In[7]:


# 创建一个文件夹保存训练模型的权重
# create direction for saving weights
if not os.path.exists("save_weights"):
    os.makedirs("save_weights")

# 给出训练模型的一些基本参数
im_height = 56
im_width = 56
batch_size = 3
# 迭代次数
epochs = 50

# In[10]:


# class dict
data_class = [cla for cla in os.listdir(train_dir) if ".txt" not in cla]
class_num = len(data_class)
# 获取类别信息
class_dict = dict((value, index) for index, value in enumerate(data_class))
print(class_num)
print(class_dict)

# In[11]:


# reverse value and key of dict
# 将key value值进行反转
inverse_dict = dict((val, key) for key, val in class_dict.items())
# write dict into json file
# 将dict写入一个json文件中进行保存
json_str = json.dumps(inverse_dict, indent=4)
with open('class_indices.json', 'w') as json_file:
    json_file.write(json_str)

# In[13]:


# load train images list
# 加载训练集数据
train_image_list = glob.glob(train_dir + "/*/*.jpg")
random.shuffle(train_image_list)
train_num = len(train_image_list)
train_label_list = [class_dict[path.split(os.path.sep)[-2]] for path in train_image_list]

# In[12]:


# load validation images list
# 加载测试集数据
val_image_list = glob.glob(validation_dir + "/*/*.jpg")
random.shuffle(val_image_list)
val_num = len(val_image_list)
val_label_list = [class_dict[path.split(os.path.sep)[-2]] for path in val_image_list]


# In[15]:


def process_path(img_path, label):
    # 将label转换成一个one-hot编码的形式
    label = tf.one_hot(label, depth=class_num)
    image = tf.io.read_file(img_path)
    image = tf.image.decode_jpeg(image)
    image = tf.image.convert_image_dtype(image, tf.float32)
    image = tf.image.resize(image, [im_height, im_width])
    return image, label


# In[16]:


AUTOTUNE = tf.data.experimental.AUTOTUNE

# load train dataset
# 使用tf.data.Dataset可以使用多线程
train_dataset = tf.data.Dataset.from_tensor_slices((train_image_list, train_label_list))
train_dataset = train_dataset.shuffle(buffer_size=train_num).map(process_path,
                                                                 num_parallel_calls=AUTOTUNE).repeat().batch(
    batch_size).prefetch(AUTOTUNE)

# load val dataset
val_dataset = tf.data.Dataset.from_tensor_slices((val_image_list, val_label_list))
val_dataset = val_dataset.map(process_path, num_parallel_calls=tf.data.experimental.AUTOTUNE).repeat().batch(batch_size)

# 实例化模型，传入图像的高度，宽度，对应的类别
model = vgg("vgg16", 56, 56, 36)
# 打印模型所对应的一些信息
model.summary()

# 池化层不需要参数
# 参数的绝大部分都堆积在了全连接层，卷积层需要的参数是很小的


# In[ ]:


# In[ ]:


# using keras low level api for training
# 使用keras提供的低层的API进行训练
# 定义优化器和损失的计算
# 损失计算：分类交叉熵
# 优化器：adam优化器，初始的学习率为0.0001
# from_logits如果对输出有softmax处理，就设置为false，如果没有softmax处理，就设置为true
loss_object = tf.keras.losses.CategoricalCrossentropy(from_logits=False)
optimizer = tf.keras.optimizers.Adam(learning_rate=0.0001)

train_loss = tf.keras.metrics.Mean(name='train_loss')
# 训练的准确率
train_accuracy = tf.keras.metrics.CategoricalAccuracy(name='train_accuracy')
# 测试的准确率
test_loss = tf.keras.metrics.Mean(name='test_loss')
test_accuracy = tf.keras.metrics.CategoricalAccuracy(name='test_accuracy')


@tf.function
def train_step(images, labels):
    with tf.GradientTape() as tape:
        # 通过模型得到预测结果
        predictions = model(images, training=True)
        # 计算损失值
        loss = loss_object(labels, predictions)
    # 计算变量对应的梯度
    gradients = tape.gradient(loss, model.trainable_variables)
    # 优化梯度
    optimizer.apply_gradients(zip(gradients, model.trainable_variables))

    train_loss(loss)
    train_accuracy(labels, predictions)


@tf.function
def test_step(images, labels):
    predictions = model(images, training=False)
    t_loss = loss_object(labels, predictions)

    test_loss(t_loss)
    test_accuracy(labels, predictions)


best_test_loss = float('inf')
# 训练集在一次epoch中，有多少个batch
train_step_num = train_num // batch_size
# 验证集在一次epoch中，有多少个batch
val_step_num = val_num // batch_size
for epoch in range(1, epochs + 1):
    train_loss.reset_states()  # clear history info
    train_accuracy.reset_states()  # clear history info
    test_loss.reset_states()  # clear history info
    test_accuracy.reset_states()  # clear history info
    # enumerate：将train_set组合成一个索引序列
    # t1进行程序计时
    t1 = time.perf_counter()
    for index, (images, labels) in enumerate(train_dataset):
        # 调用train_step来定义一次训练的步骤
        train_step(images, labels)
        # 因为下标从0开始的，所以如果索引到了本次epoch所要处理的batch个大小，就跳出循环，下一个epoch继续进行处理
        if index + 1 == train_step_num:
            break
    print('本次花费时间是：%f 分钟' % ((time.perf_counter() - t1)/60))


    for index, (images, labels) in enumerate(val_dataset):
        test_step(images, labels)
        if index + 1 == val_step_num:
            break

    template = 'Epoch {}, Loss: {}, Accuracy: {}, Test Loss: {}, Test Accuracy: {}'
    # format：格式化函数
    print(template.format(epoch,
                          # 保存此次训练的结果和一些参数：比如损失、精度
                          train_loss.result(),
                          # 将结果*100
                          train_accuracy.result() * 100,
                          test_loss.result(),
                          test_accuracy.result() * 100))
    # 如果本次训练的损失结果比之前最后的结果还要好，就对训练出来的结果（权重）进行更新，并且保存在一个myVGG.ckpt文件中
    # 保存模型参数，以便用于后期的测试集使用这个模型进行测试
    if test_loss.result() < best_test_loss:
        model.save_weights("./save_weights/myVGG.ckpt".format(epoch), save_format='tf')

print('运行时间：%f 分钟' % (time.perf_counter()/60))
print('当前时间：%s' % (datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')))




# In[ ]:
