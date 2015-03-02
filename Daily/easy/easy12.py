__author__ = 'ssven'
# easy12.py
# Sam Svenningsen (sjs382@cornell.edu)
# November 8, 2014

def permutations_helper(word_list):
    output = ""
    length = len(word_list)
    if length > 1:
        for i in range(length):
            x = word_list.pop(i)
            for j in permutations_helper(word_list).split(", "):
                output += x + j + ", "
            word_list.insert(i,x)
    else:
        output = word_list[0]
    return output


"""Enter word with no commas to get every combination of every
character within it, including the spaces."""
def permutations(word):
    text = list(word)
    return permutations_helper(text)
