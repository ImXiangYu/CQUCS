import numpy as np
import matplotlib.pyplot as plt


class LogisticRegression(object):
    def __init__(self, learning_rate=0.01, num_iterations=1000, batch_size=10, threshold=0.5):
        self.learning_rate = learning_rate
        self.num_iterations = num_iterations
        self.batch_size = batch_size
        self.threshold = threshold
        self.weights = None
        self.bias = None

    def sigmod(self, z):
        return 1 / (1 + np.exp(z))

    def softmax(self, z):
        return np.exp(z) / np.sum(np.exp(z), axis=1, keepdims=True)

    def fit_with_gd(self, X: np.array, y: np.array) -> 'LogisticRegression':
        self.costs = []
        self.accuracies = []
        num_samples, num_features = X.shape
        num_classes = int(len(np.unique(y)))

        # init W,b
        self.weights = np.random.randn(num_features, num_classes)
        self.bias = np.zeros(num_classes)
        y = np.eye(num_classes)[y]
        # GD
        for i in range(self.num_iterations):

            # 广播机制
            z = np.dot(X, self.weights) + self.bias
            y_pred = self.softmax(z)

            # cost其实是负对数似然的平均值

            cost = (-1 / num_samples) * np.sum(y * np.log(y_pred))
            self.costs.append(cost)
            dw = (1 / num_samples) * np.dot(X.T, (y_pred - y))
            db = (1 / num_samples) * np.sum(y_pred - y, axis=0)

            self.weights -= self.learning_rate * dw
            self.bias -= self.learning_rate * db

            # 记录每次iteration的准确率
            y_hat = np.argmax(y_pred, axis=1)
            y_accuracy = y_hat == np.argmax(y, axis=1)
            accuracy = np.mean(y_accuracy)
            self.accuracies.append(accuracy)

        print("训练完成")
        return self

    def predict(self, X: np.array) -> np.array:
        '''
        当X为(n,num_feature)的时候，输出的y_pred是(n)
        '''
        # 预测值
        z = np.dot(X, self.weights) + self.bias
        y_pred = self.softmax(z)

        # 将预测值转化成二分类问题的结果
        return np.argmax(y_pred, axis=1)

    def visullize(self):
        fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 4))

        ax1.plot(range(self.num_iterations), self.costs)
        ax1.set_title("Cost per Iteration")
        ax1.set_xlabel("Iteration")
        ax1.set_ylabel("Cost")

        ax2.plot(range(self.num_iterations), self.accuracies)
        ax2.set_title("Accuracy per Iteration")
        ax2.set_xlabel("Iteration")
        ax2.set_ylabel("Accuracy")

        plt.show()