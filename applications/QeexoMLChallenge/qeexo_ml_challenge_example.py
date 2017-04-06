#!/usr/bin/env python
""" an example of performing a simple classification with Qeexo ML Challenge data set """

import sys
import os
import numpy as np
import pandas as pd
from utility import load_instances, load_labels, load_timestamps, convert_to_classlabels, write_results


def generate_audio_features(instances):
    """ generate features
        param instances: a list of Instance class objects
        return: a feature matrix
    """

    X = pd.DataFrame(np.array([instance.audio.astype(float) for instance in instances]))
    X.columns = ["aud_" + str(k) for k in X.columns]
    return X


def generate_touch_features(instances):
    """ generate features
        param instances: a list of Instance class objects
        return: a feature matrix
    """
    touch_dict = [instance.touch for instance in instances]

    X = pd.DataFrame.from_dict(touch_dict)

    return X


def generate_features(instances):
    """ generate features
        param instances: a list of Instance class objects
        return: a feature matrix
    """

    # Load info as well later
    touch = generate_touch_features(instances)
    audio = generate_audio_features(instances)

    return pd.concat([touch, audio], axis=1)


def train_model(X, y):
    """ train a model (1 nearest neighbor)
        param X: a feature matrix
        param y: a vector contains labels
        return : trained model
    """
    # train a naive model (1-NN)
    model = {"X": X, "y": y}
    return model

                  
def test_model(X_test, model):
    """ test a model (1 nearest neighbor)
        param X_test: a feature matrix
        param model: trained 1 NN model (copy of training data)
        return : predicted labels for test data
    """
    # test a 1-NN model
    X_train = model["X"]
    y_train = model["y"]
    y_test = np.zeros(X_test.shape[0], dtype=int)
    for i in range(X_test.shape[0]):
        y_test[i] = y_train[np.argmin(np.sum((X_train-X_test[i,:])**2, axis=1)**0.5)]
    return y_test


def main(argv):

    # prepare training data
    train_instances = load_instances("../../data/train")
    X_train = generate_features(train_instances)
    y_train = load_labels(train_instances)
                  
    # build a model
    model = train_model(X_train, y_train)

    # prepare test data
    test_instances = load_instances("../../data/test")
    X_test = generate_features(test_instances)
    timestamps = load_timestamps(test_instances)
    
    # predict
    y_test = test_model(X_test, model)
    classlabels = convert_to_classlabels(y_test)

    # save results
    write_results(timestamps, classlabels, "./fingersense-test-labels.csv")

if __name__ == '__main__':
    exit(main(sys.argv[1:]))
