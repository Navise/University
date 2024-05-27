def F(n):
    if(n <= 1):
        return n
    else:
        return (F(n - 1) + F(n  - 2))

n = int(input("Enter the value of N: "))

if(n < 0):
    print("The number may be negative ")
else:
    print(F(n))