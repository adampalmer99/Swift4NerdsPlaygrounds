import Cocoa

var str = "Hello, playground"
var playgroundGreeting = str
playgroundGreeting += "! How are you today?"
str

//MARK: - Reference Semantics
// With value types you get a copy of the instance when you assign it to a new constant or variable. The same is true when pass an instance of a value type as the argument to a function.
// An instance of a reference type, behaves differently in that these 2 actions create an additional reference to the same underlying instance.


class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let hecate = GreekGod(name: "Hecate")
// Getting a reference to a Greek God
let anotherHecate = hecate

// Because hecate and anotherHecate refer to the same instance of GreekGod, a change in one will be reflected in the other
anotherHecate.name = "AnotherHecate"
anotherHecate.name
hecate.name


struct Pantheon {
    var chiefGod: GreekGod
}

let pantheon = Pantheon(chiefGod: hecate)

let zeus = GreekGod(name: "Zeus")
// pantheon.chiefGod = zeus // Cannot assign to property: 'pantheon' is a 'let' constant

// When you change the value that the name property stores, you are not changing what zeus is(which is a reference to a GreekGod). Because name is a mutable stored property, when you define the GreekGod class(via var declaration) you're free to change it as much as wanted. Regardless how much "Zeus"'s name is changed, zeus still refers to the same instance.
zeus.name = "Zeus Jr"
zeus.name

// chiefGod property is of type greekGod, greekGod is a class so is a reference type.
pantheon.chiefGod.name //AnotherHecate
let greekPantheon = pantheon
hecate.name = "Trivia"
greekPantheon.chiefGod.name

//MARK: - Copying
//gods and godsCopy have references to the same instances of GreekGod. gods contains instances of GreekGod, which is a class, which makes it a reference type.

//example of shallow copying. Shallow copying does not create a distinct copy of an instance, it creates a duplicate of the instance's reference.
let athena = GreekGod(name: "Athena")

let gods = [athena, hecate, zeus]
let godsCopy = gods
gods.last?.name = "Jupiter"
gods
godsCopy

// Deep Copy
// Deep copies duplicate the instance at the destination of a reference. Which would mean godsCopy's indices wouldn't reference the same instances of GreekGod. It would create a new array with references to its own instances of GreekGod.



