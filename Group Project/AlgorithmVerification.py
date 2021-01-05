# This script verify Newton's algorithm in approxiating
# the square root of a number

import math

def SquareRoot(n):
    x = n
    root = 0.0
    for i in range(12):
        root = 0.5 * (x + (n / x))
        x = root

    return root

# Main script
num = 0.0
NumOfCase = 0
AverageError = 0
for i in range(1000000):
    num += 1.0
    print("Test Number:\t\t\t", num)
    print("Square Root:\t\t\t", math.sqrt(num))
    print("Result from the Algorithm:\t", SquareRoot(num))
    print("Error:\t\t\t\t", abs(math.sqrt(num) - SquareRoot(num)))
    print("")

    AverageError += abs(math.sqrt(num) - SquareRoot(num))
    NumOfCase += 1

print("Average Error:\t\t", AverageError / NumOfCase)