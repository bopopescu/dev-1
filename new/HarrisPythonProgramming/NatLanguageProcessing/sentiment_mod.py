import nltk
import random
#from nltk.corpus import movie_reviews
from nltk.classify.scikitlearn import SklearnClassifier
import pickle
from sklearn.naive_bayes import MultinomialNB, BernoulliNB
from sklearn.linear_model import LogisticRegression, SGDClassifier
from sklearn.svm import SVC, LinearSVC, NuSVC
from nltk.classify import ClassifierI
from statistics import mode
from nltk.tokenize import word_tokenize



class VoteClassifier(ClassifierI):
    def __init__(self, *classifiers):
        self._classifiers = classifiers

    def classify(self, features):
        votes = []
        for c in self._classifiers:
            v = c.classify(features)
            votes.append(v)
        return mode(votes)

    def confidence(self, features):
        votes = []
        for c in self._classifiers:
            v = c.classify(features)
            votes.append(v)

        choice_votes = votes.count(mode(votes))
        conf = choice_votes / len(votes)
        return conf


def open_pickle(filename):
    with open('pickled_algos/' + filename + '.pickle','rb') as f:
        return pickle.load(f)

documents = open_pickle('documents')

word_features = open_pickle('word_features5k')


def find_features(document):
    words = word_tokenize(document)
    features = {}
    for w in word_features:
        features[w] = (w in words)

    return features



featuresets = open_pickle('featuresets')


random.shuffle(featuresets)
print("Length featuresets: ", len(featuresets))

testing_set = featuresets[10000:]
training_set = featuresets[:10000]


classifier = open_pickle('originalnaivebayes5k')

MNB_classifier = open_pickle('MNB_classifier5k')
BernoulliNB_classifier = open_pickle('BernoulliNB_classifier5k')
LogisticRegression_classifier = open_pickle('LogisticRegression_classifier5k')
LinearSVC_classifier = open_pickle('LinearSVC_classifier5k')
SGDClassifier_classifier = open_pickle('SGDC_classifier5k')

NuSVC_classifier = open_pickle('NuSVC_classifier5k')




voted_classifier = VoteClassifier(classifier,
                                  LinearSVC_classifier,
                                  MNB_classifier,
                                  BernoulliNB_classifier,
                                  LogisticRegression_classifier,
                                  SGDClassifier_classifier,
                                  NuSVC_classifier)




def sentiment(text):
    feats = find_features(text)
    return voted_classifier.classify(feats),voted_classifier.confidence(feats)