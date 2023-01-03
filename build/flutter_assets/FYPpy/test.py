import pytube
video="https://www.youtube.com/watch?v=HlBYdiXdUa8"
data=pytube.YouTube(video)
audio = data.streams.get_audio_only()
print(audio.download())

# import whisper
# model1 = whisper.load_model("large")
# text = model1.transcribe("G:\\semestevii\\fyp\\I will find YouI will Kill You Taken Movie best scene ever  liam neeson.mp4",fp16=False,language="en")
# print(text['text'])
# text['text']=re.sub(r"","")
   
# class voteclassifier(ClassifierI):
#     def __init__(self,*classifiers) :
#         self._classifiers=classifiers
#     def classify(self,features):
#         votes=[]
#         for c in self._classifiers:
#             v=c.classify(features)
#             votes.append(v)
#         return mode(votes)
#     def confidence(self,features):
#         votes=[]
#         for c in self._classifiers:
#             v=c.classify(features)
#             votes.append(v)
#         choice_votes=votes.count(mode(votes))
#         conf=choice_votes/len(votes)
#         return conf                
# #corporas - body of text
# #lexicon-dictionary
# #.tokenize has word and sent
# # stop_words=set(stopwords.words("english"))

# # sentence="I experienced breathing difficulty (eg, excessively rapid breathing, breathlessness in the absence of physical exertion)."
# # pattern= NP:{<VB>?|<VB>+<JJ>+} 
# # print(sentence)
# # words=word_tokenize(sentence)
# # tags=nltk.pos_tag(words)
# # chunk=nltk.RegexpParser(pattern)
# # ch=chunk.parse(tags)
# # ch.draw()
# # # ne=nltk.ne_chunk(tagged_tokens=tags,binary=True)
# # # ne.draw()
# # print(ch)
# # lem=WordNetLemmatizer()
# # print(lem.lemmatize("running",pos="v"))
# # syns =wordnet.synsets("depression")
# # print(syns[0].name())
# # print(syns[0].lemmas()[0])
# # print(syns[2].definition())
# # print(syns[0].examples())
# # synonyms=[]
# # antonyms=[]
# # for syn in wordnet.synsets("depression"):
# #     for l in syn.lemmas():
# #         synonyms.append(l.name())
# #         if l.antonyms():
# #             antonyms.append(l.antonyms()[0].name())
# # print(synonyms)
# # print(antonyms)            
# # w1=wordnet.synset(syns[0].name())
# # w2=wordnet.synset(syns[1].name())
# # print(w1.wup_similarity(w2))
# # from nltk.corpus import movie_reviews
# # documents=[(list(movie_reviews.words(fileid) ), category)
# # for category in movie_reviews.categories()
# # for fileid in movie_reviews.fileids(category)]
# #print(documents[1])
# # all_words=[]
# # for w in movie_reviews.words():
# #     all_words.append(w.lower())
# short_pos=open("positive.txt","r").read()
# short_neg=open("negative.txt","r").read()
# documents=[]
# all_words=[]
# allowed_type=["J"]
# for r in short_pos.split("\n"):
#     documents.append((r,"pos"))
#     words=word_tokenize(r)
#     pos=nltk.pos_tag(words)
#     for w in pos:
#         if w[1][0] in allowed_type:
#             all_words.append(w[0].lower())
# for r in short_neg.split("\n"):
#     documents.append((r,"neg"))
#     words=word_tokenize(r)
#     pos=nltk.pos_tag(words)
#     for w in pos:
#         if w[1][0] in allowed_type:
#             all_words.append(w[0].lower())   
# all_words=nltk.FreqDist(all_words)
# # print(all_words.most_common(10))
# # print(all_words["stupid"])
# word_features=list(all_words.keys())[:5000]
# def find_features(document):
#     words=word_tokenize(document)
#     features={}
#     for w in word_features:
#         features[w]=(w in words)
#     return features
# # print((find_features(movie_reviews.words( neg/cv000_29416.txt ))))
# featureset=[(find_features(rev),category) for (rev,category) in documents]
# import random
# random.shuffle(featureset)
# training_set=featureset[:10000]
# test_set=featureset[10000:]
# classifier=nltk.NaiveBayesClassifier.train(featureset[:1900])
# # classifier_file=open("naivebayes.pickle","rb")
# # classifier=pickle.load(classifier_file)
# # classifier_file.close()
# classifier.show_most_informative_features(15)
# print("Naive Baiyes accuracy percent:",(nltk.classify.accuracy(classifier,test_set)))
# # save_classifier=open("naivebayes.pickle","wb")
# # pickle.dump(classifier,save_classifier)
# # save_classifier.close()
# mnbclassifier=SklearnClassifier(MultinomialNB())
# mnbclassifier.train(training_set)
# print("MNB accuracy percent:",(nltk.classify.accuracy(mnbclassifier,test_set)))

# bernoulliclassifier=SklearnClassifier(BernoulliNB())
# bernoulliclassifier.train(training_set)
# print("bernoulli accuracy percent:",(nltk.classify.accuracy(bernoulliclassifier,test_set)))

# # lgrclassifier=SklearnClassifier(LogisticRegression())
# # lgrclassifier.train(training_set)
# # print("LGR accuracy percent:",(nltk.classify.accuracy(lgrclassifier,test_set)))

# sdgclassifier=SklearnClassifier(SGDClassifier())
# sdgclassifier.train(training_set)
# print("sdgc accuracy percent:",(nltk.classify.accuracy(sdgclassifier,test_set)))

# svcclassifier=SklearnClassifier(SVC())
# svcclassifier.train(training_set)
# print("SVC accuracy percent:",(nltk.classify.accuracy(svcclassifier,test_set)))

# nusvcclassifier=SklearnClassifier(NuSVC())
# nusvcclassifier.train(training_set)
# print("nu svc accuracy percent:",(nltk.classify.accuracy(nusvcclassifier,test_set)))

# lsvcclassifier=SklearnClassifier(LinearSVC())
# lsvcclassifier.train(training_set)
# print("linear svc accuracy percent:",(nltk.classify.accuracy(lsvcclassifier,test_set)))

# votedclassifier=voteclassifier(classifier,sdgclassifier,bernoulliclassifier,svcclassifier,nusvcclassifier,lsvcclassifier,mnbclassifier)
# # print("voted classifier accuracy:",(nltk.classify.accuracy(votedclassifier,test_set)*100))
# # print("classification:",votedclassifier.classify(test_set[0][0]),"confidence:",votedclassifier.confidence(test_set[0][0]))
# # print("classification:",votedclassifier.classify(test_set[1][0]),"confidence:",votedclassifier.confidence(test_set[1][0]))
