def num_flips(pancakes, K):
    arr = [p == '+' for p in pancakes]
    count = 0

    # At the start of each step, everything before index i is flipped the right way
    # During each step, the pancake at i is flipped the right way
    # This greedy algorithm finds the optimal solution if it exists.
    for i, p in enumerate(arr):
        # If pancake is down and you can flip to the left of it
        if not p and i + K <= len(arr):
            count += 1
            for j in range(i, i + K):
                arr[j] = not arr[j]

    is_true = True
    for p in arr:
        is_true &= p
    if is_true:
        return str(count)
    else:
        return "IMPOSSIBLE"

if __name__ == '__main__':

    T = int(input())
    for i in range(T):

        pancakes, K = input().split()
        K = int(K)

        n = num_flips(pancakes, K)
        print("Case #{}: {}".format(i + 1, n))
