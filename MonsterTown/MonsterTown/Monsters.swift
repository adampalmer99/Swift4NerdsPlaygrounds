//
//  Monsters.swift
//  MonsterTown
//
//  Created by Adam Palmer on 20/12/2022.
//

import Foundation

class Monster {
    var town: Town?
    var name = "Monster"
    
    func terroriseTown() {
        if town != nil {
            print("\(name) is terrorising a town!")
        } else {
            print("\(name) hasn't found a town to terrorise yet...")
        }
    }
}
