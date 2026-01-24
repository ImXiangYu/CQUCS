import numpy as np
from graphviz import Digraph
from sklearn.metrics import accuracy_score


class DecisionTree:
    def __init__(self, problem_type='classification', criterion='gini', max_depth=None):
        if problem_type not in ['classification', 'regression']:
            raise ValueError("problem_type should be 'classification' or 'regression'")
        if criterion not in ['gini', 'entropy', 'mse']:
            raise ValueError("criterion should be 'gini', 'entropy' or 'mse'")
        if problem_type == 'regression' and criterion != 'mse':
            raise ValueError("CART algorithm for regression should use 'mse' criterion")

        self.criterion_map = {
            'gini': self._gini,
            'entropy': self._entropy,
            'mse': self._mse
        }

        self.problem_type = problem_type
        self.criterion = criterion
        self.max_depth = max_depth
        self.tree = None

        self._criterion = self.criterion_map[criterion]

    def _gini(self, y):
        # 计算基尼系数
        _, counts = np.unique(y, return_counts=True)
        probs = counts / len(y)
        gini = 1 - np.sum(probs ** 2)
        return gini

    def _entropy(self, y):
        # 计算信息熵
        _, counts = np.unique(y, return_counts=True)
        probs = counts / len(y)
        entropy = -np.sum(probs * np.log2(probs))
        return entropy

    def _mse(self, y):
        # 计算均方误差
        mean_y = np.mean(y)
        mse = np.mean((y - mean_y) ** 2)
        return mse

    def _split(self, X, y, feature_idx, threshold):
        # 根据特征和阈值拆分数据集
        left_mask = X[:, feature_idx] <= threshold
        right_mask = X[:, feature_idx] > threshold
        return X[left_mask], y[left_mask], X[right_mask], y[right_mask]

    def _find_best_split(self, X, y):
        # 寻找最佳拆分
        best_feature_idx, best_threshold, best_score, best_groups = None, None, float('inf'), None
        n_features = X.shape[1]

        for feature_idx in range(n_features):
            feature_values = set(X[:, feature_idx])
            for feature_value in feature_values:
                threshold = feature_value
                groups = self._split(X, y, feature_idx, threshold)
                X_left, y_left, X_right, y_right = groups

                score = (len(y_left) * self._criterion(y_left) + len(y_right) * self._criterion(y_right)) / len(y)

                if score < best_score:
                    best_feature_idx, best_threshold, best_score, best_groups = feature_idx, threshold, score, groups

        return {'feature_idx': best_feature_idx, 'threshold': best_threshold, 'score': best_score,
                'groups': best_groups}

    def _terminal_node(self, y):
        # y是取值的列表
        if len(y) == 0:
            return None
        if self.problem_type == 'classification':
            return np.argmax(np.bincount(y))
        else:  # self.problem_type == 'regression'
            return np.mean(y)

    def _split_node(self, node, X, y, depth):
        X_left, y_left, X_right, y_right = node['groups']
        del (node['groups'])

        # Check if information entropy is zero
        if self.max_depth is not None and depth >= self.max_depth:
            node['left'], node['right'] = self._terminal_node(y_left), self._terminal_node(y_right)
            return
        if len(y_left) == 0 or len(y_right) == 0:
            node['left'] = node['right'] = self._terminal_node(np.concatenate((y_left, y_right)))
            return

        entropy_left = self._entropy(y_left)
        entropy_right = self._entropy(y_right)

        if entropy_left == 0:
            node['left'] = self._terminal_node(y_left)
        else:
            node['left'] = self._find_best_split(X_left, y_left)
            self._split_node(node['left'], X_left, y_left, depth + 1)

        if entropy_right == 0:
            node['right'] = self._terminal_node(y_right)
        else:
            node['right'] = self._find_best_split(X_right, y_right)
            self._split_node(node['right'], X_right, y_right, depth + 1)

    def fit(self, X, y):
        self.tree = self._find_best_split(X, y)
        self._split_node(self.tree, X, y, 1)

    def _predict_sample(self, node, x):
        if x[node['feature_idx']] <= node['threshold']:
            if isinstance(node['left'], dict):
                return self._predict_sample(node['left'], x)
            else:
                return node['left']
        else:
            if isinstance(node['right'], dict):
                return self._predict_sample(node['right'], x)
            else:
                return node['right']

    def predict(self, X):
        return np.array([self._predict_sample(self.tree, x) for x in X])

    def _prune_node(self, node, X_test, y_test):
        if isinstance(node['left'], dict):
            self._prune_node(node['left'], X_test, y_test)
        if isinstance(node['right'], dict):
            self._prune_node(node['right'], X_test, y_test)

        if not isinstance(node['left'], dict) and not isinstance(node['right'], dict):
            y_pred_before_pruning = self.predict(X_test)

            new_prediction = self._terminal_node(
                np.concatenate((y_test[X_test[:, node['feature_idx']] <= node['threshold']],
                                y_test[X_test[:, node['feature_idx']] > node['threshold']])))
            original_left = node['left']
            original_right = node['right']
            node['left'] = node['right'] = new_prediction

            y_pred_after_pruning = self.predict(X_test)

            if self.problem_type == 'classification':

                if accuracy_score(y_test, y_pred_before_pruning) <= accuracy_score(y_test, y_pred_after_pruning):
                    return
                else:
                    node['left'] = original_left
                    node['right'] = original_right

            elif self.problem_type == 'regression':
                from sklearn.metrics import mean_squared_error
                if mean_squared_error(y_test, y_pred_before_pruning) >= mean_squared_error(y_test,
                                                                                           y_pred_after_pruning):
                    return
                else:
                    node['left'] = original_left
                    node['right'] = original_right

    def post_pruning(self, X_test, y_test):
        self._prune_node(self.tree, X_test, y_test)

    def print_tree(self, node=None, depth=0):
        if node is None:
            node = self.tree

        if isinstance(node, dict):
            print('{}[X{} <= {:.3f}]'.format(depth * '  ', node['feature_idx'], node['threshold']))
            self.print_tree(node['left'], depth + 1)
            self.print_tree(node['right'], depth + 1)
        else:
            print('{}[{}]'.format(depth * '  ', node))

    def _visualize_tree(self, node, graph, parent=None, edge_label=None):
        if not isinstance(node, dict):
            node_id = str(hash(node))
            graph.node(node_id, label=str(node), shape='ellipse', style='filled', fillcolor='#C0C0C0')
            if parent is not None:
                graph.edge(parent, node_id, label=edge_label)
            return

        node_id = str(hash(node['threshold']))
        graph.node(node_id, label=f'X{node["feature_idx"]} <= {node["threshold"]:.3f}')
        if parent is not None:
            graph.edge(parent, node_id, label=edge_label)

        self._visualize_tree(node['left'], graph, parent=node_id, edge_label='True')
        self._visualize_tree(node['right'], graph, parent=node_id, edge_label='False')

    def visualize_tree(self, path=None, view=False, name='decision_tree'):
        graph = Digraph()
        self._visualize_tree(self.tree, graph)
        if path:
            graph.render(path + name, view=False, format='png')
        if view:
            graph.view()
        return graph
