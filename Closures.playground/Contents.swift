import Cocoa
import Foundation

var population: Int = 21000
var message: String
var hasPostOffice: Bool = true

if population < 10000 {
    message = "\(population) is a small town!"
} else {
    message = "\(population) is pretty big"
}

if !hasPostOffice {
    print("Where do we buy stamps?")
}

//MARK: - TERNARY OPERATOR

message = population < 10000 ? "\(population) is a small town" : "\(population) is pretty big"


//MARK: - NESTED IFS
// >= comparison operator, && logical operator

if population < 10000 {
    message = "\(population) is a small town"
} else {
    if population >= 10000 && population < 5000 {
        message = "\(population) is a medium town"
    } else {
        message = "\(population) is pretty big"
    }
}
print(message)


//MARK: - ELSE IF
// can have as many else if clauses as you want as only one condition will match

if population < 10000 {
    message = "\(population) is a small town"
} else if population >= 10000 && population < 5000 {
    message = "\(population) is a medium town"
} else if population > 20000 {
    message = "\(population) is a large town"
} else {
    message = "\(population) is a pretty big town"
}

print(message)

