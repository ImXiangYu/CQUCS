# 分类，这里使用的是sklearn自带的酒数据集
import numpy as np
from sklearn.datasets import load_wine
from sklearn.model_selection import train_test_split
from DecisionTree import DecisionTree

# 导入酒数据集
wine = load_wine()
X = wine.data
y = wine.target

# 对数据集进行拆分
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=42)

# 进行决策树分类
wine_clf = DecisionTree(problem_type='classification', criterion='gini', max_depth=12)
wine_clf.fit(X_train, y_train)

# 在训练集和测试集上进行预测
y_train_pred = wine_clf.predict(X_train)
y_test_pred = wine_clf.predict(X_test)

# 未剪枝准确率
train_accuracy = np.mean(y_train == y_train_pred)
test_accuracy = np.mean(y_test == y_test_pred)

print(f"Train accuracy (no pruning): {train_accuracy:.3f}")
print(f"Test accuracy (no pruning): {test_accuracy:.3f}")

# 对决策树进行剪枝
wine_clf.post_pruning(X_test, y_test)

# 在训练集和测试集上进行预测
y_train_pred = wine_clf.predict(X_train)
y_test_pred = wine_clf.predict(X_test)

# 剪枝准确率
train_accuracy = np.mean(y_train == y_train_pred)
test_accuracy = np.mean(y_test == y_test_pred)

print(f"Train accuracy (with pruning): {train_accuracy:.3f}")
print(f"Test accuracy (with pruning): {test_accuracy:.3f}")

# 决策树可视化
wine_clf.visualize_tree(path='./graph/', name='wine_clf')
