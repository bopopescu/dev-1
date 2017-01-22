import nltk
import random
import pickle
from nltk.classify.scikitlearn import SklearnClassifier
from nltk.corpus import movie_reviews

from sklearn.naive_bayes import MultinomialNB, GaussianNB, BernoulliNB

from sklearn.linear_model import LogisticRegression, SGDClassifier
from sklearn.svm import SVC, LinearSVC, NuSVC

from nltk.classify import ClassifierI
from statistics import mode

class VoteClassifier(ClassifierI):
    def __init__(self, *classifiers):
        self._classifiers = classifiers

    def classify(self, featureset):
        votes = []
        for classifier in self._classifiers:
            v = classifier.classify(featureset)
            votes.append(v)
        return mode(votes)

    def confidence(self, featureset):
        votes = []
        for c in self._classifiers:
            v = c.classify(featureset)
            votes.append(v)
        choice_votes = votes.count(mode(votes))
        conf = choice_votes / len(votes)
        return conf


def pickle_file(object, filename):
    with open('pickled_algos/' + filename + '.pickle','wb') as f:
        pickle.dump(object, f)

short_pos = open("short_reviews/positive.txt","r", encoding='ISO-8859-1').read()
short_neg = open("short_reviews/negative.txt","r", encoding='ISO-8859-1').read()

documents = []
all_words = []

#  j is adject, r is adverb, and v is verb
# allowed_word_types = ["J","R","V"]
allowed_word_types = ["J"]

for p in short_pos.split('\n'):
    documents.append((p, "pos"))
    words = nltk.word_tokenize(p)
    pos = nltk.pos_tag(words)
    for w in pos:
        if w[1][0] in allowed_word_types:
            all_words.append(w[0].lower())

for p in short_neg.split('\n'):
    documents.append((p, "neg"))
    words = nltk.word_tokenize(p)
    pos = nltk.pos_tag(words)
    for w in pos:
        if w[1][0] in allowed_word_types:
            all_words.append(w[0].lower())

pickle_file(documents, 'documents')


all_words = nltk.FreqDist(all_words)

word_features = list(all_words.keys())[:5000]

pickle_file(word_features, 'word_features5k')

def find_features(document):
    words = nltk.word_tokenize(document)
    features = {}
    for w in word_features:
        features[w] = (w in words)
    return features


featuresets = [(find_features(rev), category) for (rev, category) in documents]

pickle_file(featuresets, 'featuresets')

random.shuffle(featuresets)

training_set = featuresets[:10000]
testing_set = featuresets[10000:]

# Naive Bayes
# posterior = prior x likelihood/evidence


classifier = nltk.NaiveBayesClassifier.train(training_set)
# classifier_f = open("naivebayes.pickle",'rb')
# classifier = pickle.load(classifier_f)
# classifier_f.close()
print("Original Naive Bayes Algo Accuracy: ", nltk.classify.accuracy(classifier, testing_set)*100)

classifier.show_most_informative_features(15)



MNB_classifier = SklearnClassifier(MultinomialNB())
MNB_classifier.train(training_set)
print("MNB Algo Accuracy: ", nltk.classify.accuracy(MNB_classifier, testing_set)*100)

# GaussianNB_classifier = SklearnClassifier(GaussianNB())
# GaussianNB_classifier.train(training_set)
# print("Gaussian Algo Accuracy: ", nltk.classify.accuracy(GaussianNB_classifier, testing_set)*100)

BernoulliNB_classifier = SklearnClassifier(BernoulliNB())
BernoulliNB_classifier.train(training_set)
print("BernoulliNB Algo Accuracy: ", nltk.classify.accuracy(BernoulliNB_classifier, testing_set)*100)

LogisticRegression_classifier = SklearnClassifier(LogisticRegression())
LogisticRegression_classifier.train(training_set)
print("LogisticRegression Algo Accuracy: ", nltk.classify.accuracy(LogisticRegression_classifier, testing_set)*100)


SGDClassifier_classifier = SklearnClassifier(SGDClassifier())
SGDClassifier_classifier.train(training_set)
print("SGDClassifier Algo Accuracy: ", nltk.classify.accuracy(SGDClassifier_classifier, testing_set)*100)


# SVC_classifier = SklearnClassifier(SVC())
# SVC_classifier.train(training_set)
# print("SVC Algo Accuracy: ", nltk.classify.accuracy(SVC_classifier, testing_set)*100)

LinearSVC_classifier = SklearnClassifier(LinearSVC())
LinearSVC_classifier.train(training_set)
print("LinearSVC Algo Accuracy: ", nltk.classify.accuracy(LinearSVC_classifier, testing_set)*100)

NuSVC_classifier = SklearnClassifier(NuSVC())
NuSVC_classifier.train(training_set)
print("NuSVC Algo Accuracy: ", nltk.classify.accuracy(NuSVC_classifier, testing_set)*100)

voted_classifier = VoteClassifier(classifier,MNB_classifier, BernoulliNB_classifier, LogisticRegression_classifier,
                                  SGDClassifier_classifier, LinearSVC_classifier, NuSVC_classifier)

print("voted_classifier Algo Accuracy: ", nltk.classify.accuracy(voted_classifier, testing_set)*100)


pickle_file(classifier, 'originalnaivebayes5k')
pickle_file(MNB_classifier, 'MNB_classifier5k')
pickle_file(BernoulliNB_classifier, 'BernoulliNB_classifier5k')
pickle_file(LogisticRegression_classifier, 'LogisticRegression_classifier5k')
pickle_file(LinearSVC_classifier, 'LinearSVC_classifier5k')
pickle_file(SGDClassifier_classifier, 'SGDC_classifier5k')

pickle_file(NuSVC_classifier, 'NuSVC_classifier5k')
# for i in range(5):
#     print("Classification: ", voted_classifier.classify(testing_set[i][0]), "\nConfidence: ", voted_classifier.confidence(testing_set[i][0]))



