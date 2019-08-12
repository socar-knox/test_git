
import os

# 1.데이터 불러오기
def get_file_list(dir_name):
    return os.listdir(dir_name)

def get_contents(file_list):
    y_class = []
    x_text = []
    class_dict = {
    1:"0", 2:"0",3:"0",4:"0",5:"1",6:"1",7:"1",8:"1"
    }
    # "0": 야구선수, "1": 축구선수

    for file_name in file_list:
        try:
            f=open(file_name,"r",encoding="cp949")
            category=int(file_name.split(os.sep)[1].split("_")[0])
            # file_name="news_data//1_Dae-Ho Lee walk-off ... over Rangers.txt"
            # file_name.split(os.sep)[1]="1_Dae-Ho Lee walk-off ... over Rangers.txt"
            # file_name.split(os.sep)[1].split("_")[0]="1"
            y_class.append(class_dict[category])
            x_text.append(f.read())
            f.close()
        except UnicodeDecodeError as e:
            print(e)
            print(file_name)
    return x_text, y_class

# 2.corpus 만들기 (단어사전)
def get_cleaned_text(text):
    import re
    words = re.sub('\W+','', text.lower())
    #re.sub(pattern,repl,string):
    #      string에서 pattern과 매치되는 텍스트를 repl로 치환 ('\W+': 문자 외 기호?)
    return words

#example
get_cleaned_text("I'm sorry, ben.")

def get_corpus_dict(text):
    text = [sentence.split() for sentence in text]
    cleaned_words = [get_cleaned_text(word) for words in text for word in words]
    #***
    from collections import OrderedDict
    corpus_dict =OrderedDict()
    for i,v in enumerate(set(cleaned_words)):
    #enumerate(set(*))
        corpus_dict[v]=i
    return corpus_dict

# 3.vector 화
def get_count_vector():

###############################################################################
if __name__ == "__main__":
    dir_name = "news_data"
    file_list = get_file_list(dir_name)
    file_list = [os.path.join(dir_name, file_name) for file_name in file_list]
    # 경로 관려 함수.  꼭 사용하시길 os.path.join *

    x_text, y_class = get_contents(file_list)

    corpus = get_corpus_dict(x_text)
    print("Number of words : {0}".format(len(corpus)))

    x_vector = get_count_vector(x_text, corpus)
