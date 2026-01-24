import os
import matplotlib.pyplot as plt
from PIL import Image
import os.path


def convertjpg(jpgfile, outdir, width=150, height=150):  # 将图片缩小到（150，150）的大小
    img = Image.open(jpgfile)
    try:
        new_img = img.resize((width, height), Image.BILINEAR)
        new_img.save(os.path.join(outdir, os.path.basename(jpgfile)))
    except Exception as e:
        print(e)


jpgfile1 = 'flower/test/flower1.jpg'  # 读取原图像
jpgfile2 = 'flower/test/flower2.jpg'  # 读取原图像
jpgfile3 = 'flower/test/flower3.jpg'  # 读取原图像
jpgfile4 = 'flower/test/flower4.jpg'  # 读取原图像
jpgfile5 = 'flower/test/flower5.jpg'  # 读取原图像
convertjpg(jpgfile1, "flower/newtest/")  # 图像大小改变到（150,150）
convertjpg(jpgfile2, "flower/newtest/")  # 图像大小改变到（150,150）
convertjpg(jpgfile3, "flower/newtest/")  # 图像大小改变到（150,150）
convertjpg(jpgfile4, "flower/newtest/")  # 图像大小改变到（150,150）
convertjpg(jpgfile5, "flower/newtest/")  # 图像大小改变到（150,150）

print("Success")
# img_scale = plt.imread('flower/newtest/flower2.jpg')
# plt.imshow(img_scale)  # 显示改变图像大小后的图片确实变到了（150,150）大小
# plt.show()
