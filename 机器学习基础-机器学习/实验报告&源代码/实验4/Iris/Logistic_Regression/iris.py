from logistic_regression import LogisticRegression
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import accuracy_score


# 导入鸢尾花数据集
iris = datasets.load_iris()
X_train, X_test, y_train, y_test = train_test_split(iris.data, iris.target, test_size=0.3, random_state=55)

# 标准化
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

# 训练模型gd
model_with_gd = LogisticRegression()
model_with_gd.fit_with_gd(X_train, y_train)

# 可视化训练过程
model_with_gd.visullize()

# 梯度下降的模型
# 预测
y_pred = model_with_gd.predict(X_test)
# 计算预测准确率
accuracy = accuracy_score(y_test, y_pred)
print('Accuracy:', accuracy)
