import Cocoa

//"typealias" allows you to define "Velocity" as an alternative type name for Double.
typealias Velocity = Double

extension Velocity {
    var kph: Velocity { return self * 1.60934 }
    var mph: Velocity { return self}
}

// Adding protocol conformance with an extension

protocol Vehicle {
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFlatBed: Bool { get }
}

// Need to create a new type before can add protocol conformance to it through an extension
// All properties are constants, except petrolLevel- which is a mutable stored property with a property observer on it. The "willSet" observer will be called every time a new value is set for petrolLevel. "precondition()" inside of this implementation to ensure the newValue being assigned to the petrolLevel property is between 0 and 1. The values will indicate how full an instance's gas tank is in terms of percentage points.
struct Car {
    let make: String
    let model: String
    let year: Int
    let colour: String
    let nickname: String
    var petrolLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1.")
        }
    }
}

// using extensions to add protocol conformance, Car now conforms to Vehicle
extension Car: Vehicle {
    var topSpeed: Velocity { return 180 }
    var numberOfDoors: Int { return 4 }
    var hasFlatBed: Bool { return false }
}

extension Car {
    init(make: String, model: String, year: Int) {
        self.init(make: make, model: model, year: year, colour: "Black", nickname: "N/A", petrolLevel: 1.0)
    }
}


var c = Car(make: "Ford", model: "Fusion", year: 2013)
extension Car {
    enum Kind {
        case coupe, sedan
    }
    var kind: Kind {
        if numberOfDoors == 2 {
            return .coupe
        } else {
            return .sedan
        }
    }
}
c.kind

extension Car {
    mutating func emptyPetrol(by amount: Double) {
        precondition(amount <= 1 && amount > 0, "Amount to remove must be beteen 0 and 1.")
        petrolLevel -= amount
    }
    
    mutating func fillPetrol() {
        petrolLevel = 1.0
    }
}

c.emptyPetrol(by: 0.3)
c.petrolLevel
c.fillPetrol()
c.petrolLevel
