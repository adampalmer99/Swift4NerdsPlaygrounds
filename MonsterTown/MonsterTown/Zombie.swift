//
//  Zombie.swift
//  MonsterTown
//
//  Created by Adam Palmer on 20/12/2022.
//

import Foundation

class Zombie: Monster {
    // Creating spookyNoise computed Type Property
    // Overriding a computed type from it's superclass, add keyword "override"
   override class var spookyNoise: String {
        return "Brains..."
    }
//    var walksWithLimp = true
    var walksWithLimp: Bool

//    private var isFallingApart = false // Falling apart is a private matter
//    internal private(set) var isFallingApart = false // making the getter internal and setter private
//    private(set) var isFallingApart = false // Using default getter visibility
    private(set) var isFallingApart: Bool
    
    init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    
    //MARK: - Convenience initialisers for classes
    // Unlike designated initialisers, convenience init aren't responsible for making sure all of a class's properties have a value. They do the work they are defined to do then hand off that info to either another convenience initialiser or designated initialiser. ALL convenience initialisers call to another initialiser on the same class. The relationship between convenience and designated on a given class defines a path by which a class's stored properties receive initial values.
    convenience init( limp: Bool, fallingApart: Bool) { // "convenience" tells compiler the initialiser needs to delegate another initialiser on the class, eventually calling to a designated initialiser.
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLimp {
            print("This zombie has a bad knee.")
        }
    }
    
    required init(town: Town?, monsterName: String) {
        walksWithLimp = false
        isFallingApart = false
        super.init(town: town, monsterName: monsterName)
    }
    //MARK: - Deinitialisation
    // Deinitialisation is part of the process off removing instances of a class from memory when they are no longer needed. Conceptually the opposite of initialisation. deinit is limited to reference types and not available for value types.
    deinit {
        print("Zombie named \(name) is no longer with us.")
    }
    
    // prevent override of terroriseTown(): "final override func"
    override func terroriseTown() {
       if !isFallingApart {
        town?.changePopulation(by: -10)
       }
        super.terroriseTown()
    }
}



