class checkpalindrome:
    def __init__(self , data):
        self.data = str(data)
    
    def ispalin(self , data):
        y = len(self.data) - 1
        p = True

        for x in range(int(y/2)):
            if(self.data[x] != self.data[y]):
                p = False
                break
            y -= 1
        return p

d =(input("Enter the number/string: "))
n = checkpalindrome(d)

if(n.ispalin(d)):
    print("Yes")
else:
    print("NO")