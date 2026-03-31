### Specification

You are to prepare a macOS command-line tool that will act as a simple calculator. The calculator will be run from the command line and will only work with integer numbers and the following arithmetic operators: `+` `-` `x` `/` `%`. The `%` operator is the modulus operator, not percentage.

For example, if the program is compiled to `calc`, the following demonstrates how it will work

    ./calc 3 + 5 - 7
    1

In the command line, the arguments are a repeated sequence in the form

    number operator

and ending in a

    number

Hitting the enter key will cause the program to evaluate the arguments and print the result. In this case `1`.

The program must follow the usual rules of arithmetic which say:

1. The `x` `/` and `%` operators must all be evaluated before the `+` and `–` operators.
2. Operators must be evaluated from left to right.

For example, using Rule 1

> 2 + 4 x 3 – 6

becomes

> 2 + 12 – 6

which results in

> 8

If we did not use Rule 1 then `2 + 4 x 3 – 6` would become `6 x 3 – 6` and then `18 – 6` and finally `12`. This is an incorrect result.

If we do not use Rule 2 then the following illustrates how it can go wrong

> 4 x 5 % 2

Going from left to right we evaluate the `x` first, which reduces the expression to `20 % 2` which becomes `0`. If we evaluated the `%` first then the expression would reduce to `4 x 1` which becomes `4`. This is an incorrect result.

Remember, we are using integer mathematics when doing our calculations, so we get integer results when doing division. For example

    ./calc 20 / 3
    6

Also note that we can use the unary `+` and `–` operators. For example

    ./calc -5 / +2
    -2
    
    ./calc +2 - -2
    4

Your program must also check to make sure the command line arguments are valid. If not your program must generate an appropriate error message and then terminate with nonzero exit status.

You should also check for division by zero errors and numeric out-of-bounds errors.

As part of your program design, it is expected you will create classes to model the problem domain.

### Program Hints

1. Getting your program to solve expressions that only use the `+` and `–` operators is fairly easy. I would suggest you get your program working at this level before attempting to get it to work with the other operators.

2. While this problem can be solved using iteration, it is easier to solve using recursion.

### Reference Implementation

The template contains a `reference/calc` executable that you can compare your implementation against. Your implementation should work in **exactly** the same manner.

Please note that it prints results to standard output and additional messages to standard error. Only standard output is used for functionality testing.


    - Is the problem broken down into functions, classes and different files? 
    - Is each class addressing a meaningful problem domain?
    - An example of **bad** functional separation: Everything in one big file with very large functions and many global variables.
- **Loose coupling**
    - Can parts of the code base be modified in isolation? Would changing one portion require significant changes throughout the code base? 
    - Is data passed between components in a structured way?
    - An example of **good** loose coupling is when functionality can be re-used in multiple components and potentially different projects.

- **Extensibility**
    - Would it be easy to add more functionality? (more operations, more numerical accuracy, interactivity, variables, etc)	
    - Can extra functionality be added to the program with minimal changes. Such as supporting different levels of precedence?
    - **Bad** extensibility would involve many hard-coded strings that are used in multiple places.

- **Control flow**
    - Are all actions of the same type handled at the same level?
    - Can another developer understand the logic flow of your program by reading the main entry point? 
    - **Bad** control flow could be caused by exiting the program outside of the main routine.

- **Error handling**
    - Are errors detected at appropriate places? Can they be collected somewhere central?
    - Are errors correctly thrown and caught? Are they appropriately handled in the main routine?
    - Is the user presented with meaningful errors when they do something incorrectly such as providing invalid input?
