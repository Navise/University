file  = input("Enter the name of the file: ")

try:
    F = open(file , "r")
except:
    print("The file do not exist!!!")

n = int(input("Enter the number of lines: "))
for i in range(n):
    line = F.readline().strip()

    if line:
        print(line)
    else:
        print("End of the lines")

word = input("Enter the word to check its occurence: ")
count = 0

with open(file , "r") as F:
    for line in F:
        words = line.split()
        for i in words:
            if(i == word):
                count += 1
            

print("The occurence of the words in the file is: ",count)






