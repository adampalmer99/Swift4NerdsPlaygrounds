//
//  Monsters.swift
//  MonsterTown
//
//  Created by Adam Palmer on 20/12/2022.
//

import Foundation

class Monster {
    // Add new static property to represent the fact monsters are terrifying, because added to Zombie's superclass "Monster" it is available on Zombie. 
    static let isTerrifying = true
    
    class var spookyNoise: String {
        return "Grrr"
    }
    
    var town: Town?
//    var name = "Monster"
    var name: String
    
    // define getter for the property via same gert used for townSize, the getter uses nil coalescing operator to check whether the Monster instance has a town it is terrorising. if yes it returns towns population, if the instance has not yet found a town to terrorise, it returns 0.
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        // Specifying newVictimPool wthin the parentheses means you're supplying an explicitly named new value. Can refer to this variable within the setter's implementation. If hadn't explicitly named new value Swift would have provided a variable called newValue to hold the same information.
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    // argument for ton in the initialiser matches property name so have to set property's value through self, but name doesn't need self because initialiser's parameter name is different.
  required init(town: Town?, monsterName: String) {    //"required" means subclasses must implement this initialiser
        self.town = town
        name = monsterName
    }
 
    
    func terroriseTown() {
        if town != nil {
            print("\(name) is terrorising a town!")
        } else {
            print("\(name) hasn't found a town to terrorise yet...")
        }
    }
}
