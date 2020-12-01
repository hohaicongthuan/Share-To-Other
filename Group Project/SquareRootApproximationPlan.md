# SQUARE ROOT APPROXIMATION CIRCUIT PLAN

## ALGORITHM FLOW CHART
(Newton's method of calculating square root)

<img src="C:\GitHub\Share-To-Other\Group Project\Reference\SquareRootApproximation.png" style="zoom: 25%;" />


## STEPS

* S1:  Input number n
* S2: x = n;
* S3: root = x / n;
* S4: root = root + x;
* S5 : root = root / 2;
* S6: temp = root - x
* S7: temp = |temp|
* S8: temp = temp - l (if the result is a negative number, it means temp is less than l)
* S9: x = root

## ALU
ALU's capable of doing the following operations: __add__, __subtract__, __divide__ 2 floating-point numbers, calculate __absolute__ value of a floating-point number as well as __divide it by 2__ (this could be achieved by simply decreasing the exponent by 1).

ALU's flags:

* zero: = 1 when ALU's result is 0
* negative: = 1 when ALU's result is < 0

## REGISTER FILE
Register file needs __at least 5 registers__ for x, n, root, temp and l.