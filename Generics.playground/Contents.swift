import Cocoa

//MARK: - Generic Stack
// A generic stack is a last-in first-out data structure. Push an item onto the stack(adds item to stack), pop to remove the most recently pushed item off of the stack.

//struct Stack {
//    var items = [Int]()
//
//    mutating func push(_ newItem: Int) {
//        items.append(newItem)
//    }
//
//    mutating func pop() -> Int? {
//        guard !items.isEmpty else {
//            return nil
//        }
//        return items.removeLast()
//    }
//}

// push(_:) method pushes a new item onto the stack by appending it to the end of the items array.
// pop() method pops the top item off the stack by calling removeLast() method of an array, which removes and returns the last item.
// pop returns optional int because stack might be empty

//var intStack = Stack<Int>()
//intStack.push(1)
//intStack.push(2)
//
//print(intStack.pop()) // prints optional 2
//print(intStack.pop()) // prints optional 1
//print(intStack.pop()) // prints nil


//MARK: - Making Stack generic
// Add a placeholder type "<Element>" named Element, to declaration of the stack.
// Swift syntax for declaring a generic uses angle brackets<> and immediately follos name of the type.
// The placeholder type Element can be used inside the Stack structure anywhere a concrete type could be used- replaced all the "Int" occurences with "Element".
struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    //MARK: - Mapping on a Stack
    // map(_:) method only declares one placeholder type "U", but uses both "Element" and "U". Element type's available because map(_:) is inside Stack structure, which makes the placeholder available. Returns new Stack rather than Array.

    func map<U>(_ f: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
}

// intStack and stringStack are both "Stack" instances, but don't have the same type. intStack is a "Stack<Int>", can only take Int, and stringStack can only take a String, otherwise compiler-time error occurs.
var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
var doubleStack = intStack.map { 2 * $0 }

print(doubleStack.pop()) // prints Optional(4)
print(doubleStack.pop()) // prints Optional(2)

var stringStack = Stack<String>()
stringStack.push("This is a String")
stringStack.push("Another String")

print(stringStack.pop()) // Prints Optional("another String")


//MARK: - Generic Functions and Methods

// mymap(function name), "[T]" input array(each item has type T), "(T) -> (U) Closure that takes an argument of type T and returns a value of type U, [U] Return value is an array(each item has type U)
func myMap<T, U>(items: [T], _ f: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}
// myMap(_:_:) can be used same ay as map(_:). Create an array and map it to an array of their character view's lengths.

let strings = ["one", "two", "three"]
let stringLengths = myMap(items: strings) { $0.count}
print(stringLengths)

// Closure passed to myMap(_:_:) must take a single argument that matches the type contained in the items array, but type of its return value can be anything. In the call to myMap(_:_:), "T" is replaced by String and U is replaced by Int.(In real projects don't need to declare own mapping function, use built in map(_:))

// Methods can be generic, inside of types that are already generic. myMap(_:_:) only works on arrays.

//MARK: - Using a type constraint to allow checking for equality
// declare placeholder "T" must conform to equatable. allows to check the instances passed in to function for equality.
func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a different string"))

//MARK: - Using a type constraint to check CustomStringConvertible values.

func checkIfDescriptionMatch<T: CustomStringConvertible, U: CustomStringConvertible>(
    _ first: T, _ second: U) -> Bool {
        return first.description == second.description
    }

print(checkIfDescriptionMatch(Int(1), UInt(1)))     // true
print(checkIfDescriptionMatch(1, 1.0))          // false
print(checkIfDescriptionMatch(Float(1.0), Double(1.0)))    // true
