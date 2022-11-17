import Cocoa

// Function Parameters
func printPersonalGreeting(name: String) {
    print("Hello \(name)")
}
printPersonalGreeting(name: "Adam")

// Using explicit parameter names
//This parameter helps function read more like you would speak, "Print personal greeting to Adam",
func printPersonalGreeting2(to name: String) {
    print("Hello \(name)")
}
printPersonalGreeting2(to: "Adam")


// function for division

func divisionDescriptionFor(numerator: Double, denominator: Double) {
    print("\(numerator) divided by  \(denominator) equals \(numerator / denominator)")
}
divisionDescriptionFor(numerator: 9.0, denominator: 3.0)

//MARK: - Variadic parameters
// variadic parameter takes zero or more input values for it's argument. A function can only have one variadic parameter, should typically be the final parameter in the list. the values provided to the argument are made available within the functions body as an array.

func printPersonalGreetings(to names: String...) {
    for name in names {
        print("Hello \(name)")
    }
}
printPersonalGreetings(to: "Alex", "Chris", "Bob", "Pat")


// Default parameter values

func divDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") {
    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)")
}

divDescriptionFor(numerator: 9.0, denominator: 3.0)
divDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!")


//MARK: - In-out parameters
// In-out parameters allow a function's impact on a variable to live beyond the function's body. There are a few caveats(limitations/conditions): in-out parameters cannot have default values, variadic parameters cannot be marked with inout.

var error = "The request failed:"

func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)
error


// Returning from a function

func divDescriptionFor2(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") -> String {
    return "\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)"
}
print(divDescriptionFor2(numerator: 9.0, denominator: 3.0, withPunctuation: "!"))


//MARK: - Nested functions and scope
// divide() isn't available outside of scope
func areaOfTriangleWith(base: Double, height: Double) -> Double {
 let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}
areaOfTriangleWith(base: 3.0, height: 5.0)

//divide()

//MARK: - Multiple returns

func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return(evens, odds)
}

// Calling sortedEvenOddNumbers(_:)

let aBunchOfNumbers = [10, 1, 4, 3, 57, 43, 84, 27, 156, 111]
let sortedNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
print("The even numbers are: \(sortedNumbers.evens); the odd numbers are: \(sortedNumbers.odds)")


//MARK: - Optional return types
// return type is optional because middle name might be nil.
// Declared middle name as type String?, nil can be passed for that portion of the tuple, can't pass nil for first and last.

func grabMiddleName (fromFullName name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(fromFullName: ("Matt", nil, "Mathias"))
if let theName = middleName {
    print(theName)
}

//let middleName = grabMiddleName(fromFullName: ("Matt", "Peter", "Mathias"))
//if let theName = middleName {
//    print(theName)
//}

//MARK: - Exiting Early from a Function

// If nil is passed for middle, "Hey there!" will be logged to console

func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle, middleName.count < 4  else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}
greetByMiddleName(fromFullName: ("Matt", "Danger", "Mathias"))


//MARK: - Bronze Challenge- add a clause in the guard statement to check if the middle name is less than 4 characters long

// Inserted above^ "middleName.count < 4"


