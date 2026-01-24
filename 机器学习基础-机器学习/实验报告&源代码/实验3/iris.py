import numpy as np
import matplotlib.pyplot as plt
from neural_network import NeuralNetwork
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import OneHotEncoder

# 导入鸢尾花数据集
iris = load_iris()
X = iris.data
y = iris.target

# 数据预处理(标准化)
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# 对类别进行 one-hot 编码
encoder = OneHotEncoder(sparse_output=False)
y_onehot = encoder.fit_transform(y.reshape(-1, 1))

# 划分训练集和测试集
x_train, x_test, y_train, y_test = train_test_split(X_scaled, y_onehot, test_size=0.2, random_state=38)

# 创建并训练 NN 模型
NN = NeuralNetwork(eta=0.01, input_layer=4, hidden_layer=6, output_layer=3, activation_func='sigmoid')
NN.train(x_train.T, y_train.T, epochs=1000)

# 准确率和错误样本
accuracy, incorrect_indices = NN.evaluate(x_test.T, y_test.T)
print(f"Accuracy: {accuracy}%")
print(f"Incorrectly classified data indices: {incorrect_indices}")

# 可视化训练结果
# 预测测试集
NN.data = x_test.T
NN.forward()
y_pred = np.argmax(NN.output2, axis=0)

# 将 one-hot 编码转换为类别索引
y_true_indices = np.argmax(y_test, axis=1)

# 创建一个颜色映射，用于不同类别的数据点
colors = ['blue', 'green', 'red']

# 绘制真实标签散点图
for i, color in enumerate(colors):
    plt.scatter(x_test[y_true_indices == i, 0], x_test[y_true_indices == i, 1], c=color, label=f'Class {i} (true)')

# 绘制预测标签散点图（带圆圈）
for i, color in enumerate(colors):
    plt.scatter(x_test[y_pred == i, 0], x_test[y_pred == i, 1], c='none', edgecolors=color, marker='o', s=100,
                linewidths=2, label=f'Class {i} (pred)')

# 显示图例
plt.legend()
plt.title('Iris dataset - True labels vs Predicted labels')
plt.xlabel('Feature 1')
plt.ylabel('Feature 2')
plt.show()
