import Cocoa

//MARK: - Canonical equivalence
// Canonical equivalence refers to whether 2 sequences of Unicode scalars are the same linguistically. 2 characters or 2 strings are considered equal if they have same linguistic meaning and appearance regardless of if built from the same Unicode scalars.

let aAcute = "\u{0061}\u{0301}"
let aAcutePrecomposed = "\u{00E1}"
print(aAcute, aAcutePrecomposed)

let b = (aAcute == aAcutePrecomposed) // true

// aAcute was created using 2 Unicode Scalars and aAcutePrecomposed used 1, they are equivalent because of canonical equivalence


//MARK: - Counting elements

// Characters

print("aAcute: \(aAcute.count); aAcutePrecomposed: \(aAcutePrecomposed.count)")

//MARK: - Indices and Ranges

let playground = "Hello, playground"

// finding 5th character
let start = playground.startIndex
let end = playground.index(start, offsetBy: 4)
let fifthCharacter = playground[end] // "o"

// Pulling out a range

let range = start...end
let firstFive = playground[range] // "Hello"
