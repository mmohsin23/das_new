from datamodel import contractions,cleaning,dprs_word2vectortest,anx_word2vectortest,strs_word2vectortest,depress_rf,anxiety_rf,stress_rf,depressedsimilar,anxioussimilar,stresssimilar
import pandas as pd
import numpy as np
import whisper
import re
import nltk
from nltk import word_tokenize,WordNetLemmatizer
from nltk.corpus import stopwords
import time
start_time = time.time()
model1 = whisper.load_model("base")
text = model1.transcribe("G:\\semestevii\\fyp\\Mr robot  i hate when I cant hold in my loneliness.mp4",fp16=False,language="en")
# with open("codebook.txt","r") as f:
#   lines=f.readlines()
# qlist={}
# qno=[]
# qs=[]
# for line in lines:
#   temp=re.split("\\t",line)
#   temp[1]=temp[1].strip("\n")
#   qno.append(temp[0])
#   qs.append(temp[1])
# qlist['Qno']=qno
# qlist['Questions']=qs
# questions=pd.DataFrame(qlist)
# tempq=questions['Questions']
# questions['Questions']=questions['Questions'].apply(lambda post:re.sub(r"\'"," ",post))
# questions["Questions"]=questions["Questions"].apply(lambda post:contractions(post))
# questions["Questions"]=questions["Questions"].apply(lambda post:cleaning(post))
# questions['Questions']=questions['Questions'].apply(lambda post:re.sub(r" +"," ",post))
# questions["Questions"]=questions["Questions"].apply(lambda post:word_tokenize(post))
# cleaned_words=[]
# stop_words=set(stopwords.words("english"))
# for words in questions["Questions"]:
#   temp=[]
#   for w in words:
#     if w not in stop_words:
#       temp.append(w)
#   cleaned_words.append(temp)
# questions["Questions"]=cleaned_words
# pos=[]
# for words in questions["Questions"]:
#   temp=nltk.pos_tag(words)
#   pos.append(temp)
# allowed_type=["JJ","RB","JJR","JJS","RBR","RBS","NN","NNS","NNP"]
# convert={"a":["JJ","JJR","JJS"],"r":["RB","RBR","RBS"],"n":["NN","NNS","NNP"]}
# cleaned_words=[]
# lematizer=WordNetLemmatizer();
# for words in pos:
#   temp=[]
#   for w in words:
#     if w[1] in allowed_type:
#       for key,val in convert.items():
#         if w[1] in val:
#           temp.append(lematizer.lemmatize(w[0],pos=key)) 
#   cleaned_words.append(temp)
# questions["Questions"]=cleaned_words
# questions["Questions"]=[list(set(t)) for t in questions["Questions"]]
# questions["dvectors"]=questions["Questions"].apply(lambda post:dprs_word2vectortest(post))
# questions["avectors"]=questions["Questions"].apply(lambda post:anx_word2vectortest(post))
# questions["svectors"]=questions["Questions"].apply(lambda post:strs_word2vectortest(post))
# temp=[]
# for i,q in questions.iterrows():
#   dscore=depressedsimilar(q["dvectors"])
#   ascore=anxioussimilar(q["avectors"])
#   sscore=stresssimilar(q["svectors"])
#   if(ascore>=dscore and ascore>=sscore):
#     temp.append("A")
#   elif(dscore>=ascore and dscore>=sscore):
#     temp.append("D")
#   elif(sscore>=dscore and sscore>=ascore):
#     temp.append("S")
    
# questions["label"]=temp
# questions.drop(['dvectors','avectors','svectors'],axis=1,inplace=True)
# questions["Questions"]=tempq
# questions.to_csv('questions.csv',index=False)
text['text']=re.sub(r"\'"," ",text["text"])
post=contractions(text["text"])
post=cleaning(post)
post=re.sub(" +"," ",post)
post=word_tokenize(post)
stop_words=set(stopwords.words("english"))
temp=[]
for w in post:
    if w not in stop_words:
      temp.append(w)
post=temp
pos=[]
pos=nltk.pos_tag(post)
allowed_type=["JJ","RB","JJR","JJS","RBR","RBS","NN","NNS","NNP"]
convert={"a":["JJ","JJR","JJS"],"r":["RB","RBR","RBS"],"n":["NN","NNS","NNP"]}
cleaned_words=[]
lematizer=WordNetLemmatizer();
for w in pos:
  if w[1] in allowed_type:
    for key,val in convert.items():
        if w[1] in val:
            cleaned_words.append(lematizer.lemmatize(w[0],pos=key)) 
post=list(set(cleaned_words))
dvectorizedpost=dprs_word2vectortest(post)
avectorizedpost=anx_word2vectortest(post)
svectorizedpost=strs_word2vectortest(post)     
#changetraintotestincosinesimilarity
dv=np.array([np.array(dvectorizedpost)])
av=np.array([np.array(avectorizedpost)])
sv=np.array([np.array(svectorizedpost)])
depressed,anxious,stressed=depress_rf(dv),anxiety_rf(av),stress_rf(sv)
label=" "
if(int(depressed)>int(anxious) and int(depressed)>int(stressed)):
  label="D"
elif(int(anxious)>int(depressed) and int(anxious)>int(stressed)):
  label="A"
elif(int(stressed)>int(depressed) and int(stressed)>int(anxious)):
  label="S"
elif(int(anxious)==int(depressed) and int(depressed)==1 and int(stressed)==0):
  dv=depressedsimilar(dvectorizedpost)
  av=anxioussimilar(avectorizedpost)
  if(dv>av):
    label="D"
  else:
    label="A"
elif(int(anxious)==int(stressed) and int(stressed)==1 and int(depressed)==0):
  sv=stresssimilar(svectorizedpost)
  av=anxioussimilar(avectorizedpost)
  if(sv>av):
    label="S"
  else:
    label="A"    
elif(int(stressed)==int(depressed) and int(depressed)==1 and int(anxious)==0):
  dv=depressedsimilar(dvectorizedpost)
  sv=stresssimilar(svectorizedpost)
  if(dv>sv):
    label="D"
  else:
    label="S"
else:
  dv=depressedsimilar(dvectorizedpost)
  sv=stresssimilar(svectorizedpost)
  av=anxioussimilar(avectorizedpost)
  if(dv>sv and dv>av):
    label="D"
  elif(sv>dv and sv>av):
    label="S"
  else:
    label="A"    

print(label)
print(time.time()-start_time,"seconds")