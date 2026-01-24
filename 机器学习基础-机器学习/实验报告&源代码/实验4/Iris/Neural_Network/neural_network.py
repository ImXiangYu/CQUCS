import numpy as np
import matplotlib.pyplot as plt


class NeuralNetwork:
    def __init__(self, eta=0.01, input_layer=4, hidden_layer=6, output_layer=3, activation_func='sigmoid'):
        """
        :param input_layer:  输入层 假设初始为4
        :param hidden_layer: 隐藏层 假设初始为6
        :param output_layer: 输出层 假设初始为3
        :param eta:         学习率
        :param activation_func:   激活函数 默认为sigmoid
        """
        # 参数初始化
        self.input_layer = input_layer
        self.hidden_layer = hidden_layer
        self.output_layer = output_layer
        self.eta = eta
        self.activation_func = activation_func

        # 变量初始化
        # 输入层 -> 隐藏层
        self.w1 = np.random.normal(0.0, pow(hidden_layer, -0.5), (hidden_layer, input_layer))
        # 权重 w1初始化为[6,4]矩阵，正态分布
        self.b1 = np.zeros((hidden_layer, 1))
        # 权重 b1初始化为[6,1]矩阵，全为0

        # 隐藏层 -> 输出层
        self.w2 = np.random.normal(0.0, pow(output_layer, -0.5), (output_layer, hidden_layer))
        # 权重 w2初始化为[3,6]矩阵，正态分布
        self.b2 = np.zeros((output_layer, 1))
        # 权重 b2初始化为[3,1]矩阵，全为0

    # 定义激活函数
    def sigmoid(self, x):
        return 1.0 / (1.0 + np.exp(-x))

    def softmax(self, x):
        e_x = np.exp(x - np.max(x))
        return e_x / e_x.sum(axis=0)

    def relu(self, x):
        return np.maximum(0, x)

    # 前向传播
    def forward(self):
        z1 = np.dot(self.w1, self.data) + self.b1

        if self.activation_func == 'sigmoid':
            self.output1 = self.sigmoid(z1)
        elif self.activation_func == 'relu':
            self.output1 = self.relu(z1)
        else:
            raise ValueError("Invalid activation function for hidden layer")

        z2 = np.dot(self.w2, self.output1) + self.b2
        # 输出层输出值[3,1]
        self.output2 = self.softmax(z2)

    # 损失函数
    def cross_entropy_loss(self, y_true, y_pred):
        n_samples = y_true.shape[1]
        loss = -np.sum(y_true * np.log(y_pred)) / n_samples
        return loss

    # 反向传播
    def backward(self, x, y):
        n_samples = x.shape[1]

        # 前向传播
        self.data = x
        self.forward()

        # 计算输出层误差
        output_error = self.output2 - y

        # 计算隐藏层误差
        if self.activation_func == 'sigmoid':
            hidden_error = np.dot(self.w2.T, output_error) * self.output1 * (1 - self.output1)
        elif self.activation_func == 'relu':
            hidden_error = np.dot(self.w2.T, output_error) * (self.output1 > 0)
        else:
            raise ValueError("Invalid activation function")

        # 更新输出层权重和偏置
        self.w2 -= self.eta * np.dot(output_error, self.output1.T) / n_samples
        self.b2 -= self.eta * np.sum(output_error, axis=1, keepdims=True) / n_samples

        # 更新隐藏层权重和偏置
        self.w1 -= self.eta * np.dot(hidden_error, self.data.T) / n_samples
        self.b1 -= self.eta * np.sum(hidden_error, axis=1, keepdims=True) / n_samples

    def train(self, x_train, y_train, epochs=100):
        loss_history = []
        accuracy_history = []

        for epoch in range(epochs):
            self.backward(x_train, y_train)
            loss = self.cross_entropy_loss(y_train, self.output2)
            accuracy = np.sum(np.argmax(y_train, axis=0) == np.argmax(self.output2, axis=0)) / x_train.shape[1] * 100
            loss_history.append(loss)
            accuracy_history.append(accuracy)

            if epoch % 10 == 0:
                print(f'Epoch {epoch}, Loss: {loss}')

        # 可视化训练过程
        fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 4))
        fig.suptitle('Training Loss and Accuracy')
        ax1.set_xlabel('Epochs')
        ax1.set_ylabel('Loss')
        ax1.plot(loss_history)
        ax2.set_xlabel('Epochs')
        ax2.set_ylabel('Accuracy')
        ax2.plot(accuracy_history)

        plt.show()

    def predict(self, x):
        # 前向传播，得到预测结果
        z1 = np.dot(self.w1, x) + self.b1

        if self.activation_func == 'sigmoid':
            # 隐藏层输出值[6,1]
            output1 = self.sigmoid(z1)
        elif self.activation_func == 'relu':
            output1 = self.relu(z1)
        else:
            raise ValueError("Invalid activation function for hidden layer")

        z2 = np.dot(self.w2, output1) + self.b2
        # 输出层输出值[3,1]
        output2 = self.softmax(z2)

        # 获取预测标签
        y_pred = np.argmax(output2, axis=0)

        return y_pred

    def evaluate(self, x, y_true):
        # 前向传播，得到预测结果
        self.data = x
        self.forward()
        y_pred = np.argmax(self.output2, axis=0)

        # 将真实标签转换为类别索引
        y_true_indices = np.argmax(y_true, axis=0)

        # 计算精确度
        accuracy = np.mean(y_pred == y_true_indices) * 100

        # 收集未分类正确的数据
        incorrect_indices = np.where(y_pred != y_true_indices)[0]
        return accuracy, incorrect_indices
