//
//  main.swift
//  MonsterTown
//
//  Created by Adam Palmer on 20/12/2022.
//

import Foundation


var myTown = Town()
let myTownSize = myTown.townSize
print(myTownSize)
print("Population: \(myTown.population), number of stoplights: \(myTown.numberOfStopLights)")

// Changing myTown population does not change townSize- Due to being lazy still on first time it was calculated.
myTown.changePopulation(by: 1_000_000)
myTown.printDescription()

let genericMonster = Monster()
genericMonster.town = myTown
genericMonster.terroriseTown()

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terroriseTown()
fredTheZombie.town?.printDescription()
