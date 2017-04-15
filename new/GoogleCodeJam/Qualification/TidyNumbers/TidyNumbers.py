
def is_tidy(num):
    arr = [int(x) for x in str(num)]

    is_true = True
    for i in range(1, len(arr)):
        is_true &= (arr[i-1] <= arr[i])
    return is_true

def get_tidy(num):
    minimum = num

    while not is_tidy(minimum):
        arr = [int(x) for x in str(minimum)]
        l = len(arr)
        for i in reversed(range(1, l)):
            if arr[i - 1] > arr[i]:

                mod = 10 ** (l - i )

                minimum -=  (minimum % mod) + 1
                break

    return minimum

if __name__ == '__main__':

    T = int(input())
    for i in range(T):

        num = int(input())

        n = get_tidy(num)
        print("Case #{}: {}".format(i + 1, n))
