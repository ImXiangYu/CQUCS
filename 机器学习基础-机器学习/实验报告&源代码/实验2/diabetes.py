# 回归，这里使用的是sklearn自带的糖尿病数据集
import numpy as np
from sklearn.datasets import load_diabetes
from sklearn.model_selection import train_test_split
from DecisionTree import DecisionTree
from sklearn.metrics import mean_squared_error


# 定义NMSE
def normalized_mean_squared_error(y_true, y_pred):
    mse = mean_squared_error(y_true, y_pred)
    variance = np.var(y_true)
    nmse = mse / variance
    return nmse


# 导入糖尿病数据集
diabetes = load_diabetes()
X = diabetes.data
y = diabetes.target

# 对数据集进行拆分
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=42)

# 进行决策树回归
diabetes_reg = DecisionTree(problem_type='regression', criterion='mse', max_depth=4)
diabetes_reg.fit(X_train, y_train)

# 在训练集和测试集上进行预测
y_train_pred = diabetes_reg.predict(X_train)
y_test_pred = diabetes_reg.predict(X_test)

# 计算未剪枝MSE
train_mse = normalized_mean_squared_error(y_train, y_train_pred)
test_mse = normalized_mean_squared_error(y_test, y_test_pred)

print(f"Train MSE (no pruning): {train_mse:.3f}")
print(f"Test MSE (no pruning): {test_mse:.3f}")

# 对决策树进行剪枝
diabetes_reg.post_pruning(X_test, y_test)

# 在训练集和测试集上进行预测
y_train_pred = diabetes_reg.predict(X_train)
y_test_pred = diabetes_reg.predict(X_test)

# 计算剪枝MSE
train_mse = normalized_mean_squared_error(y_train, y_train_pred)
test_mse = normalized_mean_squared_error(y_test, y_test_pred)

print(f"Train MSE (with pruning): {train_mse:.3f}")
print(f"Test MSE (with pruning): {test_mse:.3f}")

# 决策树可视化
diabetes_reg.visualize_tree(path='./graph/', name='diabetes_reg')
