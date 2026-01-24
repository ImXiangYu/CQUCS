# 回归，这里使用的是sklearn自带的波士顿房价数据集
import numpy as np
import pandas as pd
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import train_test_split
from DecisionTree import DecisionTree

# 由于某些原因，sklearn原本自带的波士顿房价数据集不能正常使用
# 因此采用比较复杂的方式导入
data_url = "http://lib.stat.cmu.edu/datasets/boston"
raw_df = pd.read_csv(data_url, sep="\s+", skiprows=22, header=None)
data = np.hstack([raw_df.values[::2, :], raw_df.values[1::2, :2]])
target = raw_df.values[1::2, 2]


# 定义NMSE
def normalized_mean_squared_error(y_true, y_pred):
    mse = mean_squared_error(y_true, y_pred)
    variance = np.var(y_true)
    nmse = mse / variance
    return nmse


# 获取波士顿房价的数据
X = data
y = target

# 对数据集进行拆分
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=42)

# 进行决策树回归
boston_reg = DecisionTree(problem_type='regression', criterion='mse', max_depth=5)
boston_reg.fit(X_train, y_train)

# 在训练集和测试集上进行预测
y_train_pred = boston_reg.predict(X_train)
y_test_pred = boston_reg.predict(X_test)

# 计算未剪枝MSE
train_mse = mean_squared_error(y_train, y_train_pred)
test_mse = mean_squared_error(y_test, y_test_pred)

print(f"Train MSE (no pruning): {train_mse:.3f}")
print(f"Test MSE (no pruning): {test_mse:.3f}")

# 对决策树进行剪枝
boston_reg.post_pruning(X_test, y_test)

# 在训练集和测试集上进行预测
y_train_pred = boston_reg.predict(X_train)
y_test_pred = boston_reg.predict(X_test)

# 计算剪枝MSE
train_mse = mean_squared_error(y_train, y_train_pred)
test_mse = mean_squared_error(y_test, y_test_pred)

print(f"Train MSE (with pruning): {train_mse:.3f}")
print(f"Test MSE (with pruning): {test_mse:.3f}")

# 决策树可视化
boston_reg.visualize_tree(path='./graph/', name='boston_reg')
