//
//  Town.swift
//  MonsterTown
//
//  Created by Adam Palmer on 20/12/2022.
//

import Foundation


struct Town {
    let region = "South"
    var population = 5_422
    var numberOfStopLights = 4
    
    enum Size {
        case small
        case medium
        case large
    }
    
    // townSize marked as lazy- This means townSize's value will only be calculated when it is first accessed. Marking townSize as lazy indicates to the compiler that this property doesn't need to have a value for "self" to be created, and should instead be created the first time townSize is accessed if it doesn't exist.
    lazy var townSize: Size = {
        switch self.population {
        case 0...10_000:
            return Size.small
            
        case 10_001...100_000:
            return Size.medium
        // Catches any population over 100_000
        default:
            return Size.large
        }
    }()
    //^ parenthesese combined with "lazy" marking ensure tat Swift will call the closure and assign the result it returns to townSize when the property is accessed for the first time. Without the parentheses, swift would be assigning a closure to the townSize property.
    
    func printDescription() {
        print("population: \(population); number of stoplights: \(numberOfStopLights)")
    }
    
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
    
}
