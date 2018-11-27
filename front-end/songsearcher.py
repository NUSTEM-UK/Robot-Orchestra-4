from songlist import songdict
# dependency pip3 install fuzzywuzzy
# pip3 install python-Levenshtein - not dependent but removes an annoying warning
# fuzzywuzzy does our matching
from fuzzywuzzy import fuzz
from fuzzywuzzy import process

def searcher(input_string):
    bestGuess = []
    bestAccuracy = 0
    input_string = input_string.lower()
    
    for key, value in songdict.items():
        accuracy = fuzz.token_set_ratio(input_string, key)
        if accuracy > bestAccuracy:
            bestGuess = key
            bestAccuracy = accuracy
            bestSong = value
            
    return(bestGuess, bestAccuracy, bestSong)

# if __name__ == "__main__" means this code will only run if this is the main python code (not imported as a module)
if __name__ == "__main__":
    a,b,c = searcher(tweet)
    print(a,b)
    print(c)