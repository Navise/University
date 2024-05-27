def insertionsort(lst):

    for i in range(1 , len(lst)):

        j = i - 1

        key = lst[i]

        while(j >= 0 and lst[j] > key):
            lst[j + 1] = lst[j]
            j -= 1
        
        lst[j + 1] = key
    
    return lst

def mergesort(lst):

    if len(lst) > 1:
        mid = len(lst) // 2
        left = lst[:mid]
        right = lst[mid:]

        mergesort(left)
        mergesort(right)

        i = j = k = 0

        while i < len(left) and j < len(right):
            if(left[i] < right[j]):
                lst[k] = left[i]
                i += 1
            else:
                lst[k] = right[j]
                j += 1
            k +=1
        while i< len(left):
            lst[k] = left[i]
            i += 1
            k += 1

        while j < len(right):
            lst[k] = right[j]
            j += 1
            k += 1
    
    return lst

lst = [1, 2 ,4, 64, 3 ,45, 10 , 0 , -8880]
x = insertionsort(lst)
print(x)