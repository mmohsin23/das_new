from flask import Flask,request,jsonify
from datamodel import contractions,cleaning,anx_word2vectortest,dprs_word2vectortest,strs_word2vectortest,depress_rf,stress_rf,anxiety_rf,depressedsimilar,stresssimilar,anxioussimilar
import re
import numpy as np
import nltk
from nltk import word_tokenize,WordNetLemmatizer
from nltk.corpus import stopwords
app=Flask(__name__)
@app.route('/api',methods=['GET'])
def hello_world():
    query=str(request.args['text'])
    text=re.sub("\'"," ",query)
    text=contractions(text)
    text=cleaning(text)
    post=re.sub(" +"," ",text)
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
        if(dv.all()>av.all()):
            label="D"
        else:
            label="A"
    elif(int(anxious)==int(stressed) and int(stressed)==1 and int(depressed)==0):
        sv=stresssimilar(svectorizedpost)
        av=anxioussimilar(avectorizedpost)
        if(sv.all()>av.all()):
            label="S"
        else:
            label="A"    
    elif(int(stressed)==int(depressed) and int(depressed)==1 and int(anxious)==0):
        dv=depressedsimilar(dvectorizedpost)
        sv=stresssimilar(svectorizedpost)
        if(dv.all()>sv.all()):
            label="D"
        else:
            label="S"
    else:
        dv=depressedsimilar(dvectorizedpost)
        sv=stresssimilar(svectorizedpost)
        av=anxioussimilar(avectorizedpost)
    if(dv.all()>sv.all() and dv.all()>av.all()):
        label="D"
    elif(sv.all()>dv.all() and sv.all()>av.all()):
        label="S"
    else:
        label="A"
    d={}
    d['text']=post
    d['label']=label    
    return jsonify(d)
if __name__=="__main__":
    app.run()