from functools import reduce

# def find_rect(kid, mat, x, y, R, C):
#     left_x = x - 1
#     right_x = x + 1
#     top_y = y - 1
#     bot_y = y + 1
#     while top_y >= 0 and mat[top_y][x] in ['?', kid]:
#         top_y -= 1
#
#     while bot_y < R and mat[bot_y][x] in ['?', kid]:
#         bot_y += 1
#     is_rect = True
#     while is_rect and right_x < C:
#         new_col = [mat[r][right_x] for r in range(top_y+1, bot_y)]
#         for n_c in new_col:
#             if n_c != '?':
#                 is_rect = False
#                 break
#         if is_rect:
#             right_x += 1
#
#     is_rect = True
#     while is_rect and left_x >= 0:
#         new_col = [mat[r][left_x] for r in range(top_y + 1, bot_y)]
#         for n_c in new_col:
#             if n_c != '?':
#                 is_rect = False
#                 break
#         if is_rect:
#             left_x -= 1
#     for r in range(top_y+1, bot_y):
#         for c in range(left_x+1, right_x):
#             mat[r][c] = kid
#     return mat

def find_rect(kid, mat, x, y, R, C):
    left_x = x - 1
    right_x = x + 1
    top_y = y - 1
    bot_y = y + 1
    while left_x >= 0 and mat[y][left_x] in ['?', kid]:
        left_x -= 1

    while right_x < C and mat[y][right_x] in ['?', kid]:
        right_x += 1
    is_rect = True
    while is_rect and bot_y < R:
        new_col = [mat[bot_y][c] for c in range(left_x+1, right_x)]
        for n_c in new_col:
            if n_c != '?':
                is_rect = False
                break
        if is_rect:
            bot_y += 1

    is_rect = True
    while is_rect and top_y >= 0:
        new_col = [mat[top_y][c] for c in range(left_x+1, right_x)]
        for n_c in new_col:
            if n_c != '?':
                is_rect = False
                break
        if is_rect:
            top_y -= 1
    for r in range(top_y+1, bot_y):
        for c in range(left_x+1, right_x):
            mat[r][c] = kid
    return mat

def handle_mat(mat, R, C):
    seen = []

    for y in range(R):
        for x in range(C):

            if mat[y][x] != '?' and not mat[y][x] in seen:
                kid = mat[y][x]
                seen.append(kid)
                mat = find_rect(kid, mat, x, y, R, C)
    return mat

if __name__ == '__main__':

    T = int(input())
    for i in range(T):

        R, C = [int(x) for x in input().split()]

        # Get RxC matrix
        mat = [list(input()) for _ in range(R)]

        mat = handle_mat(mat, R, C)

        print("Case #{}:".format(i + 1))
        for row in mat:
            print(''.join(row))
