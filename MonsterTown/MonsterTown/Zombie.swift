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
    var walksWithLimp = true
//    private var isFallingApart = false // Falling apart is a private matter
//    internal private(set) var isFallingApart = false // making the getter internal and setter private
    private(set) var isFallingApart = false // Using default getter visibility
    
    // prevent override of terroriseTown(): "final override func"
   final override func terroriseTown() {
       if !isFallingApart {
        town?.changePopulation(by: -10)
       }
        super.terroriseTown()
    }
}



