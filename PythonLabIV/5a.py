import re
def isphonenumber(pattern):
    if(len(pattern) == 12):
        if(pattern[:3].isdigit() and pattern[4:7].isdigit() and pattern[8:12].isdigit() and pattern[3] == '-' and pattern[7] == '-'):
            print("The pattern is valid")
        else:
            print("This is pattern is invalid")
    
pattern = input("Enter the pattern of phone number: ")

isphonenumber(pattern)

x = re.search(r'^\d{3}-\d{3}-\d{4}$', pattern)

if(x):
    print("The pattern matches using regex")
else:
    print("The pattern is invalid using regex ")