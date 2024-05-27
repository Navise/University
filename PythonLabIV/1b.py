y = input("Enter the number to check palindrom: ")
printed = []
if(y == y[::-1]):
    print("The given number",y,"is a palindrome")
else:
    print("The number ",y," is not a palindrome")

x = str(y)
for i in range(len(x)):
    if(x[i] not in printed):
        print("The occurence of ", x[i] ," is ", x.count(x[i]))
        printed.append(x[i])
    
    

