//
//  main.swift
//  MonsterTown
//
//  Created by Adam Palmer on 20/12/2022.
//

import Foundation


var myTown = Town()
print("Population: \(myTown.population), number of stoplights: \(myTown.numberOfStopLights)")

myTown.changePopulation(by: 500)
myTown.printDescription()

let genericMonster = Monster()
genericMonster.town = myTown
genericMonster.terroriseTown()

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terroriseTown()
fredTheZombie.town?.printDescription()
