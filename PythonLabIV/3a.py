string = input("Enter the sentence: ")

digit = alpha = lower = upper = 0
for i in string:
    if(i.isdigit()):
        digit += 1
    if(i.isalpha()):
        alpha += 1
    if(i.islower()):
        lower += 1
    if(i.isupper()):
        upper += 1
print("The number of words in the string is ", len(string.split()))
print("The number of alphabets in the string is ",alpha)
print("The number of digits in the stirng is ",digit)
print("The number of lower case letter is ",lower)
print("The number of upper case letter in string is ",upper)