import difflib

str1 = input("Enter the string 1: ")
str2 = input("Enter the string 2: ")

x = difflib.SequenceMatcher(a=str1 , b=str2)
print(x.ratio())