import Cocoa

print("The maximum Int value is \(Int.max)")
print("The mininum Int value is \(Int.min)")
print("The max value for 32-bit integer is \(Int32.max)")
print("The min value for 32-bit integer is \(Int32.min)")

// UInt = unsigned integer type
// difference between signed and unsigned at binary level is that the power of 2 represented by the top-most bit (2^7 for 8-bit integers) is positive instead of negative

print("The max UInt value is \(UInt.max)")
print("The min UInt value is \(UInt.min)")
print("The max value for a 32-bit unsigned integer is \(UInt32.max)")
print("The min value for a 32-bit unsigned integer is \(UInt32.min)")


//MARK: -  DECLARING INT EXPLICITLY AND IMPLICITLY
let numberOfPages: Int = 10 // explicitly
let numberOfChapters = 3 // of type int, inferred by compiler

let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -1000

// DECLARING INTEGER TYPES WITH INVALID VALUES
//let firstBadValue: UInt = -1
//let secondBadValue: Int8 = 200
//
// Int8 can cold values from -128 to 127

//MARK: -  OPERATIONS ON INTEGERS
// ORDER OF OPERATIONS
 
print(10 + 2 * 5) //20 because 2*5 is evaluated first
print(30 - 5 - 5) //20 because 30-5 is evaluated first

// Parentheses
print((10 + 2) * 5) // 60 because () evaluated first
print(30 - (5 - 5))// 30 bc () evaluated first

// INTEGER DIVISION
 
print(11 / 3) // prints 3
// result of any operation between 2 integers returns an integer of same type, 3.6666etc is not whole number cant be represented as integer. swift truncates the fractional part leaving just 3. if result is negative such as -11/3 the fractional part still truncated giving result of -3. integer division always rounds towards 0.

//MARK: - Remainders

print(11 % 3) // prints 3
print(-11 % 3) // prints -2


//MARK: - combining addition or subtraction and assignment

// operator shorthand
var x = 10
x += 10 // Is equivalent to: x = x + 10
print("x has had 10 added to it and is now \(x)")
x -= 5 // is equivalent to: x = x - 5
print("x has had 5 subtracted from it and is now \(x)")


//MARK: - overflow operators

let y: Int8 = 120
//let z = y + 10 // error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION
// y is an int8, compiler assumes y + 10 must be too, compiler infers type of z to be int8, when hit run y + 10 is calculated equalling 30, but int8 only ranges from -128...127

// swift provides overflow operators that have different behaviours when value is too big or too small, instead of trapping the program they "WRAP AROUND."
// WRAP AROUND means that when the number gets to its max(127), so -128 is the 8th number(of the 10), -127 is the 9th so the 10th is -126
// The overflow addition operator is &+

let z = y &+ 10
print("120 &+ 10 is \(z)")


//MARK: - CONVERTING BETWEEN INTEGER TYPES

let a: Int16 = 200
let b: Int8 = 50
//let c = a + b // cant be operated, compile error

let c = a + Int16(b)

print(c)


//MARK: - Floating point numbers

let d1 = 1.1 // Implicitly double
let d2: Double = 1.1
let f1: Float = 100.3

print(10.0 + 11.4)
print(11.0 + 3.0)

if d1 == d2 {
    print("d1 and d2 are the same")
}

print("d1 + 0.1 is \(d1 + 0.1)")
if d1 + 0.1 == 1.2 {
    print("d1 is equal to 1.2")
}
// Technically not equal because swift rounds these numbers to 1.2


