//
//  main.swift
//  MonsterTown
//
//  Created by Adam Palmer on 20/12/2022.
//

import Foundation


//var myTown = Town()
// using intialisers
var myTown = Town(region: "West", population: 10_000, stopLights: 6 )
let myTownSize = myTown.townSize
print(myTownSize)
print("Population: \(myTown.population), number of stoplights: \(myTown.numberOfStopLights)")

// Changing myTown population does not change townSize- Due to being lazy still on first time it was calculated.
myTown.changePopulation(by: 1_000_000)
print("Size: \(myTown.townSize); population: \(myTown.population)")
myTown.printDescription()

//let genericMonster = Monster()
//genericMonster.town = myTown
//genericMonster.terroriseTown()

var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.terroriseTown()
fredTheZombie?.town?.printDescription()

// creating a convenient zombie
var convenientZombie = Zombie(limp: true, fallingApart: false)

print("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500
print("Victim pool: \(fredTheZombie?.victimPool)")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}
fredTheZombie = nil


//MARK: - Instance Properties
//Instance properties are useful for storing and computing values on an instance of a type.

//MARK: - Type Properties
// These are properties that are universal to the type- the values in these properties will be shared across all of the type's instances. These properties store information that will be the same across all instances. For example, all instances of a Square type will have exactly 4 sides, so the number of sides for Square might be stored in a type property.

//MARK: - Value Types
// Value Types(structures, enumerations) can take both stored and computed type properties. As with type methods, type properties on value types begin with the static key word

//MARK: - Static and class type properties
// one of the major differences between static and class type properties is that the static properties cannot be overridden by a subclass. Making this type property a static constant is very definitive: Monsters sre terrifying and subclasses can't change that.

//MARK: - Access Control
// You can grant components of your code specific levels of access to other components of code, called "Access Control"
// Access Control is organised around 2 important and related concepts: modules and sources files. In terms of the project's files and organisation, these are the central building blocks of your application.
// A module is code that is distributed as a unit. For example "Cocoa" and "Foundation", these are frameworks, which bundle together a number of related types that perform a series of related tasks. For example, Cocoa is a framework designed to facilitate the development of macOS applications. Modules are brought into another module using Swift's keyword "import".
// Source files on the other hand are more discrete units. They represent a single file and live within a specific module.



// OPEN- Entities are visible and subclassable to all files in the module as well as those that import the module. Visible to defining module and importing modules. Subclassable within defining module and importing modules

// PUBLIC- Entities are visible and subclassable to all files in the module as well as those that import the module. Visible to defining module and importing modules. Subclassable within defining module.

// INTERNAL(the default) Entities are visible to all files in the same module. Visible to defining module. Subclasses within defining module.

// FILEPRIVATE- Entities are visible only within their defining source file. Visible to defining file. Subclassable within defining file.

// PRIVATE- Entities are visible only within their defining scope. Visible to scope. Subclassable within scope.


