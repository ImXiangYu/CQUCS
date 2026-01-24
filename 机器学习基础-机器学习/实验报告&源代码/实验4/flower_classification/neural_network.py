import numpy as np
from keras import layers
from keras import models
from keras import optimizers
from keras.src.legacy.preprocessing.image import ImageDataGenerator
from keras.src.saving import load_model
from keras.src.utils import image_utils
from matplotlib import pyplot as plt

model = models.Sequential()
# 第一个卷积层作为输入层，32个3*3卷积核，输入形状input_shape = (150,150,3)

# 输出图片尺寸：150-3+1=148*148，参数数量：32*3*3*3+32=896
model.add(layers.Conv2D(32, (3, 3), activation='relu', input_shape=(150, 150, 3)))
model.add(layers.MaxPooling2D((2, 2)))  # 输出图片尺寸：148/2=74*74

# 输出图片尺寸：74-3+1=72*72，参数数量：64*3*3*32+64=18496
model.add(layers.Conv2D(64, (3, 3), activation='relu'))
model.add(layers.MaxPooling2D((2, 2)))  # 输出图片尺寸：72/2=36*36

# 输出图片尺寸：36-3+1=34*34，参数数量：128*3*3*64+128=73856
model.add(layers.Conv2D(128, (3, 3), activation='relu'))
model.add(layers.MaxPooling2D((2, 2)))  # 输出图片尺寸：34/2=17*17

model.add(layers.Conv2D(128, (3, 3), activation='relu'))
model.add(layers.MaxPooling2D((2, 2)))

model.add(layers.Flatten())
model.add(layers.Dense(512, activation='relu'))
model.add(layers.Dense(5, activation='softmax'))  # sigmoid分类，输出是二元类别，softmax输出多元类别

# 编译模型
# RMSprop 优化器。因为网络最后一层是单一sigmoid单元，
# 所以使用二元交叉熵作为损失函数
model.compile(loss='binary_crossentropy',
              optimizer=optimizers.RMSprop(learning_rate=1e-4),
              metrics=['acc'])

# 归一化
train_datagen = ImageDataGenerator(rescale=1. / 255)
val_datagen = ImageDataGenerator(rescale=1. / 255)

train_dir = 'flower/train'  # 指向训练集图片目录路径

# 图像处理
train_generator = train_datagen.flow_from_directory(
    train_dir,
    target_size=(150, 150),  # 输入训练图像尺寸
    batch_size=20,
    class_mode='categorical')  #

validation_dir = 'flower/val'  # 指向验证集图片目录路径

validation_generator = val_datagen.flow_from_directory(
    validation_dir,
    target_size=(150, 150),
    batch_size=20,
    class_mode='categorical')

for data_batch, labels_batch in train_generator:
    print('data batch shape:', data_batch.shape)
    print('data batch shape:', labels_batch.shape)
    break  # 生成器不会停止，会循环生成这些批量，所以我们就循环生成一次批量

history = model.fit(train_generator, validation_data=validation_generator, epochs=30)
# 保存训练模型
model.save('flower/flowermodel.h5')

accuracy =history.history['acc']
loss = history.history['loss']
val_loss = history.history['val_loss']
val_accuracy = history.history['val_acc']
plt.figure(figsize=(17, 7))
plt.subplot(2, 2, 1)
plt.plot(range(30), accuracy,'bo', label='Training Accuracy')
plt.plot(range(30), val_accuracy, label='Validation Accuracy')
plt.legend(loc='lower right')
plt.title('Accuracy : Training vs. Validation ')
plt.subplot(2, 2, 2)
plt.plot(range(30), loss,'bo' ,label='Training Loss')
plt.plot(range(30), val_loss, label='Validation Loss')
plt.title('Loss : Training vs. Validation ')
plt.legend(loc='upper right')
plt.show()