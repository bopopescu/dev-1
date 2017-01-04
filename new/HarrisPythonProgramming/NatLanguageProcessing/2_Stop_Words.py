from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
example_sentence = "This is an example showing off stop word filtration."
stop_words = set(stopwords.words("english"))

words = word_tokenize(example_sentence)

filtered_sentences = []

# for w in words:
# 	if w not in stop_words:
# 		filtered_sentences.append(w)

filtered_sentences = [w for w in words if w not in stop_words]
print(filtered_sentences)