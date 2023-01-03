//
//  Town.swift
//  MonsterTown
//
//  Created by Adam Palmer on 20/12/2022.
//

import Foundation


struct Town {
    var population = 5_422
    var numberOfStopLights = 4
    
    func printDescription() {
        print("population: \(population); number of stoplights: \(numberOfStopLights)")
    }
    
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
    
}
