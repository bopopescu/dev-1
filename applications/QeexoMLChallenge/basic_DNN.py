import tensorflow as tf
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from qeexo_ml_challenge_example import load_instances, generate_features, \
    generate_touch_features, load_labels



def input_fn(df):
    # Creates a dictionary mapping from each continuous feature column name (k) to
    # the values of that column stored in a constant Tensor.
    feature_cols = {k: tf.constant(df[k].values)
                    for k in df.columns if k != 'label'}
    # Converts the label column into a constant Tensor.
    label = tf.constant(df["label"].values)
    # Returns the feature columns and the label.
    return feature_cols, label

# prepare training data
train_instances = load_instances("data/train")
df = generate_features(train_instances)

df["label"] = load_labels(train_instances)

X = df.drop(['label'],1)
y = df.label
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)




feature_columns = []
for k in X.columns:
    feature_columns.append(tf.contrib.layers.real_valued_column(k))

# Build 3 layer DNN with 10, 20, 10 units respectively.
classifier = tf.contrib.learn.DNNClassifier(feature_columns=feature_columns, hidden_units=[100, 50, 20], activation_fn = tf.nn.relu,
                             dropout = 0.2, n_classes=2)#, optimizer = "Adam")

# Fit model.
def train_fn():
    return input_fn(pd.concat([X_train, y_train], axis=1))

def test_fn():
    return input_fn(pd.concat([X_test, y_test], axis=1))

classifier.fit(input_fn=train_fn, steps=200)

results = classifier.evaluate(input_fn=test_fn, steps=1)
for key in sorted(results):
    print("%s: %s" % (key, results[key]))

#
# # Classify two new flower samples.
# new_samples = np.array(
#     [[6.4, 3.2, 4.5, 1.5], [5.8, 3.1, 5.0, 1.7]], dtype=float)
# y = list(classifier.predict(new_samples, as_iterable=True))
# print('Predictions: {}'.format(str(y)))