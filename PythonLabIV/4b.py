def roman(s):
    roman_dict = {'I':1 , 'V':5,'X':10, 'L':50, 'C':100, 'D':500 , 'M':1000}
    integer = 0
    prev = 0

    for char in s:
        value = roman_dict.get(char)

        if prev < value:
            integer -= prev
        else:
            integer+= prev

        prev = value
    integer += prev


    return integer
print(roman('MMD'))
print(roman('MCMXC'))