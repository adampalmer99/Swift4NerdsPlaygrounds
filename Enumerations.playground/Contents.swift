import Cocoa

//MARK: - Enumerations

// Int- raw value
enum TextAlignment: Int {
    case left = 20
    case right = 30
    case center = 40
    case justify = 50
}

// Type inference
//var alignment: TextAllignment = TextAllignment.left
var alignment = TextAlignment.justify

// Infering the enum type
alignment = .right

//if alignment == .right {
//    print("We should right-align the text!")
//}

switch alignment {
case .left:
    print("left aligned")
case .right:
    print("right aligned")
case .center:                   // returning to explicit cases
//default:
    print("center aligned")
case .justify:
    print("justified")
}

print("Left has a raw value \(TextAlignment.left.rawValue)")
print("Right has a raw value \(TextAlignment.right.rawValue)")
print("Center has a raw value \(TextAlignment.center.rawValue)")
print("Justify has a raw value \(TextAlignment.justify.rawValue)")
print("The alignment variable has raw value \(alignment.rawValue)")



// Create a raw value
let myRawvalue = 20

// Try to convert the raw value into a TextAlignment
if let myAlignment = TextAlignment(rawValue: myRawvalue) {
    // Conversion succeeded
    print("Successfully converted \(myRawvalue) into a TextAlignment")
} else {
    // Conversion failed
    print("\(myRawvalue) has no corresponding TextAlignment case")
}


// Creating an enum with strings

enum programmingLanguage: String {
    case swift = "swift"
    case objectiveC = "objective-c"
    case c = "c"
    case cpp = "cpp"
    case java = "java"
}

let myFavouriteLanguage = programmingLanguage.swift
print("My favourite programming language is \(myFavouriteLanguage.rawValue)")


//MARK: - Methods

enum lightbulb {
    case on
    case off


func surfaceTemp(forAmbientTemperature ambient: Double) -> Double {
    switch self {
    case .on:
        return ambient + 150.0
    case .off:
        return ambient
    }
  }
    
    // Toggling
   mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
    
}


var bulb = lightbulb.on
let ambientTemp = 77.0

var bulbTemperature = bulb.surfaceTemp(forAmbientTemperature: ambientTemp)
print("the bulb's temperature is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surfaceTemp(forAmbientTemperature: ambientTemp)
print("The bulb's temperature is \(bulbTemperature)")


//MARK: - Associated Values


enum ShapeDimensions {
    // square's associated value is the length of one side
    case square(side: Double)
    
    // recatangles associated value defines its width and height
    case rectangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case let .square(side: side):
            return side * side
            
        case let .rectangle(width: w, height: h):
            return w * h
        }
    }
    
}

// creating shapes
var squareShape = ShapeDimensions.square(side: 10.0)
var rectangleShape = ShapeDimensions.rectangle(width: 5.0, height: 10.0)

print("square's area is \(squareShape.area())")
print("rectangle's area is \(rectangleShape.area())")
