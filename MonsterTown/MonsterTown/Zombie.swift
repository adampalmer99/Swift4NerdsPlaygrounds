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
    
    // prevent override of terroriseTown(): "final override func"
    override func terroriseTown() {
        town?.changePopulation(by: -10)
        super.terroriseTown()
    }
}



