import pandas as pd
import numpy as np
import nltk
import re
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, confusion_matrix
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, SimpleRNN, LSTM, Dense, Dropout
import matplotlib.pyplot as plt

# 下载nltk所需资源（首次运行需要，后续注释掉）
nltk.download('punkt')
nltk.download('punkt_tab')
nltk.download('stopwords')

# 配置参数（可调整，新手先固定）
MAX_WORDS = 10000  # 词表最大单词数
MAX_SEQ_LEN = 200  # 文本序列统一长度
EMBEDDING_DIM = 128  # 词嵌入维度
EPOCHS = 5  # 训练轮数
BATCH_SIZE = 32  # 批次大小



# 1. 加载数据
def load_data():
    # 读取真假新闻文件
    fake_df = pd.read_csv('E:/PythonProject3/fake_news_classification/Fake.csv')
    true_df = pd.read_csv('E:/PythonProject3/fake_news_classification/True.csv')
    # 添加标签：假新闻=0，真新闻=1
    fake_df['label'] = 0
    true_df['label'] = 1
    # 合并数据（只保留正文和标签，简化任务）
    df = pd.concat([fake_df[['text', 'label']], true_df[['text', 'label']]], axis=0)
    # 打乱数据，避免顺序影响
    df = df.sample(frac=1, random_state=42).reset_index(drop=True)
    return df

# 2. 文本清洗（去除无关字符、小写化、去停用词）
def clean_text(text):
    # 先处理空值/非字符串情况
    if pd.isna(text) or not isinstance(text, str):
        return ""
    # 去除特殊字符、数字
    text = re.sub(r'[^a-zA-Z\s]', '', text)
    # 小写化
    text = text.lower()
    # 改用punkt_tab分词（兼容新版nltk）
    from nltk.tokenize import PunktTokenizer
    tokenizer = PunktTokenizer()
    tokens = tokenizer.tokenize(text)
    # 去停用词（the/a/an等无意义词）
    stop_words = set(stopwords.words('english'))
    tokens = [word for word in tokens if word not in stop_words]
    # 拼接成字符串
    return ' '.join(tokens)
# 3. 数据预处理主函数
df = load_data()
# 清洗文本（耗时约1-2分钟，耐心等待）
df['clean_text'] = df['text'].apply(clean_text)

# 4. 文本向量化（将文字转为模型能识别的数字）
tokenizer = Tokenizer(num_words=MAX_WORDS)
tokenizer.fit_on_texts(df['clean_text'])  # 构建词表
sequences = tokenizer.texts_to_sequences(df['clean_text'])  # 文本转序列
padded_sequences = pad_sequences(sequences, maxlen=MAX_SEQ_LEN)  # 统一长度

# 5. 划分训练集/测试集（8:2）
X = padded_sequences
y = df['label'].values
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)


# ------------- 搭建基础RNN模型 -------------
def build_rnn_model():
    model = Sequential()
    # 词嵌入层：将数字序列转为稠密向量
    model.add(Embedding(input_dim=MAX_WORDS, output_dim=EMBEDDING_DIM, input_length=MAX_SEQ_LEN))
    # 简单RNN层（核心）
    model.add(SimpleRNN(64, return_sequences=False))
    # Dropout层：防止过拟合
    model.add(Dropout(0.5))
    # 全连接层：输出二分类结果（0/1）
    model.add(Dense(1, activation='sigmoid'))
    # 编译模型（优化器+损失函数+评估指标）
    model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])
    return model

# ------------- 搭建LSTM模型 -------------
def build_lstm_model():
    model = Sequential()
    model.add(Embedding(input_dim=MAX_WORDS, output_dim=EMBEDDING_DIM, input_length=MAX_SEQ_LEN))
    # 替换为LSTM层（解决RNN梯度消失问题）
    model.add(LSTM(64, return_sequences=False))
    model.add(Dropout(0.5))
    model.add(Dense(1, activation='sigmoid'))
    model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])
    return model

# 先训练RNN模型
rnn_model = build_rnn_model()
# 打印模型结构
print("RNN模型结构：")
rnn_model.summary()

# 训练模型
print("\n开始训练RNN模型...")
rnn_history = rnn_model.fit(
    X_train, y_train,
    batch_size=BATCH_SIZE,
    epochs=EPOCHS,
    validation_split=0.1  # 训练集中拆分10%作为验证集
)

# 训练LSTM模型（对比实验）
lstm_model = build_lstm_model()
print("\n开始训练LSTM模型...")
lstm_history = lstm_model.fit(
    X_train, y_train,
    batch_size=BATCH_SIZE,
    epochs=EPOCHS,
    validation_split=0.1
)

# 1. 评估RNN模型
rnn_pred = rnn_model.predict(X_test)
rnn_pred_labels = (rnn_pred > 0.5).astype(int)  # 概率>0.5为真新闻（1），否则假新闻（0）
rnn_acc = accuracy_score(y_test, rnn_pred_labels)
print(f"\nRNN模型测试集准确率：{rnn_acc:.4f}")

# 2. 评估LSTM模型
lstm_pred = lstm_model.predict(X_test)
lstm_pred_labels = (lstm_pred > 0.5).astype(int)
lstm_acc = accuracy_score(y_test, lstm_pred_labels)
print(f"LSTM模型测试集准确率：{lstm_acc:.4f}")

# 3. 绘制训练曲线（PPT核心图表）
def plot_history(history, model_name):
    plt.figure(figsize=(12, 4))
    # 准确率曲线
    plt.subplot(1, 2, 1)
    plt.plot(history.history['accuracy'], label='Training Accuracy')
    plt.plot(history.history['val_accuracy'], label='Validation Accuracy')
    plt.title(f'{model_name} Accuracy Curve')#准确率曲线
    plt.xlabel('epoch')
    plt.ylabel('accuracy')
    plt.legend()
    # 损失曲线
    plt.subplot(1, 2, 2)
    plt.plot(history.history['loss'], label='Training Loss')#训练损失
    plt.plot(history.history['val_loss'], label='Validation Loss')#验证损失
    plt.title(f'{model_name} Loss Curve')#损失曲线
    plt.xlabel('epoch')
    plt.ylabel('accuracy')
    plt.legend()
    plt.tight_layout()
    plt.savefig(f'{model_name}_history.png')  # 保存图片到项目目录（PPT用）
    plt.show()

# 绘制RNN和LSTM的训练曲线
plot_history(rnn_history, 'RNN')
plot_history(lstm_history, 'LSTM')

# 4. 混淆矩阵
rnn_cm = confusion_matrix(y_test, rnn_pred_labels)
lstm_cm = confusion_matrix(y_test, lstm_pred_labels)
print("\nRNN模型混淆矩阵：")
print(rnn_cm)
print("\nLSTM模型混淆矩阵：")
print(lstm_cm)