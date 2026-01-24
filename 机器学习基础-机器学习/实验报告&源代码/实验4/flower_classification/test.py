import numpy as np
import os
import matplotlib.pyplot as plt
from PIL import Image
from keras import layers
from keras import models
from keras import optimizers
from keras.src.legacy.preprocessing.image import ImageDataGenerator
from keras.src.utils import image_utils
from matplotlib import pyplot as plt
from keras.src.saving import load_model

model = load_model('flower/flowermodel.h5')
img = 'flower/newtest/flower5.jpg'
img_scale = plt.imread(img)
plt.imshow(img_scale)
img_scale = img_scale.reshape(1, 150, 150, 3).astype('float32')
img_scale = img_scale / 255  # 归一化到0-1之间
result = model.predict(img_scale)  # 取图片信息
print(result)
dict = {'0': 'daisy', '1': 'dandelion', '2': 'rose', '3': 'sunflower', '4': 'tulip'}
for i in range(5):
    if result[0][i] > 0.5:
        print('识别结果: ' + dict[str(i)])
        plt.title('result: ' + dict[str(i)])
plt.axis('off')  # 不显示坐标
plt.show()
