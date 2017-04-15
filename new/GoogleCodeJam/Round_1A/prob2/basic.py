from itertools import chain, combinations

def powerset(iterable):
    """
    powerset([1,2,3]) --> () (1,) (2,) (3,) (1,2) (1,3) (2,3) (1,2,3)
    """
    xs = list(iterable)
    # note we return an iterator rather than a list
    return chain.from_iterable(combinations(xs,n) for n in range(len(xs)+1))
# TODO: is_valid for package amounts
# TODO: Start combining in twos, threes greedily?
# TODO: Recursive valid?

def is_valid(recipe, packets):
    valid = False
    ratatuille = recipe.copy()

    while ratatuille[0] * .9 <= packets[0]:
        valid = True
        for i, r in enumerate(ratatuille):
            amount = packets[i]
            if r * .9 <= amount  <= r * 1.1:
                pass
            else:
                valid = False
                break
        if valid:
            break
        else:
            for i, r in enumerate(recipe):
                ratatuille[i] += r

    return valid


def max_combos(recipe, packets, N, P):
    tried_combos = []
    for i in range(P):
        for j in range(i+1, P):
            new_packet = [(packets[i][k] + packets[j][k]) for k in range(N)]
            if is_valid(recipe, new_packet):
                tried_combos.append((i,j))


    return len(tried_combos)


def num_kits(recipe, packets, N, P):

    all_combos = list(powerset(packets))
    max_amount = 0

    c_packet_default = [0 for _ in range(N)]
    for combo in all_combos:
        amount = 0

        c_packet = c_packet_default.copy()
        for c in combo:
            for j in range(N):
                c_packet[j] += c[j]

            if is_valid(recipe, c):
                amount += 1

        if amount > max_amount:
            max_amount = amount

    return max_amount

if __name__ == '__main__':

    T = int(input())
    for i in range(T):
        # N ingredients
        # P packages
        N, P = [int(x) for x in input().split()]

        # Amount needed of each ingredient
        ratatuille = [int(x) for x in input().split()]
        # Get RxC matrix
        mat = [[int(x) for x in input().split()] for _ in range(N)]
        packets = []
        for p in range(P):
            packet = []
            for n in range(N):
                packet.append(mat[n][p])
            packets.append(packet)
        n = num_kits(ratatuille, packets, N, P)
        print("Case #{}: {}".format(i + 1, n))
