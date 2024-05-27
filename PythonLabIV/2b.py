x = int(input("Enter the binary number: "))

#def btod(x):
#    return int(x , 2)
    
def btod(x):
    decimal , i  =  0,  0

    while(x != 0):
        dec = x % 10
        decimal += dec * (pow(2 , i))
        i += 1
        x //= 10
    
    print(decimal)

btod(x)