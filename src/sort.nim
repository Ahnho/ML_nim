proc Bubble_sort*[T](list:seq[T]):seq[T]=
    var tmp = 0
    for i in range(len(list)-1,0,-1):
        for j in range(i):
            if list[j] > list[j+1]:
                tmp = list[j]
                list[j] = list[j+1]
                list[j] = tmp
    return list


proc Selection_sort*[T](list:seq[T]):seq[T]=
    for i in 0..len(list)-1 :
        var om = i
        for j in i..len(list):
            if list[j] <  list[om]:
                om = j
        var tmp = list[om]
        list[om] = list[i]
        list[i] = tmp
    return list


proc Insertion_sort*[T](list:seq[T]):seq[T]=
    for i in 1..len(list):
        