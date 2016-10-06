# Samuel Svenningsen (altock)
# Project Euler Problem 9
import numpy as np
# import Euler

# 1000 digit number


def max_series_prod(num_string, adjacent):
    num_array = [int(i) for i in num_string]
    val = long(np.prod(num_array[:adjacent]))
    for i in xrange(len(num_string)-adjacent):
        new_val = long(np.prod(num_array[i:i+adjacent]))
        if new_val > val:
            val = new_val
    # for i, x in enumerate(num_array[adjacent:]):
    #     is_zero = False
    #     for y in num_array[i:i+adjacent]:
    #         if y == 0:
    #             is_zero = True

    #     if not is_zero and x != 0:
    #         # print i, len(num_array)
    #         new_val *= x / num_array[i]
    #         if new_val > val:
    #             val = new_val
    #     elif x == 0:
    #         new_val = 1
    #     else:
    #         new_val *= x
    return val


def main():
    problem = ("73167176531330624919225119674426574742355349194934969835203"
        "1277450632623957831801698480186947885184385861560789112949495459501"
        "7379583319528532088055111254069874715852386305071569329096329522744"
        "3043557668966489504452445231617318564030987111217223831136222989342"
        "3380308135336276614282806444486645238749303589072962904915604407723"
        "9071381051585930796086670172427121883998797908792274921901699720888"
        "0937766572733300105336788122023542180975125454059475224352584907711"
        "6705560136048395864467063244157221553975369781797784617406495514929"
        "0862569321978468622482839722413756570560574902614079729686524145351"
        "0047482166370484403199890008895243450658541227588666881164271714799"
        "2444292823086346567481391912316282458617866458359124566529476545682"
        "8489128831426076900422421902267105562632111110937054421750694165896"
        "0408071984038509624554443629812309878799272442849091888458015616609"
        "7919133875499200524063689912560717606058861164671094050775410022569"
        "8315520005593572972571636269561882670428252483600823257530420752963450")

    print max_series_prod(problem, 13)


# Brute-forcing it
if __name__ == '__main__':
    main()