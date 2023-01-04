//
//  Town.swift
//  MonsterTown
//
//  Created by Adam Palmer on 20/12/2022.
//

import Foundation

// Keyword "Static", Type properties on value types(see Value Types mark on main.swift)
struct Town {
//   static let region = "South"
    let region: String
    var population: Int  {
        // Property Observers- syntax similar to getters and setters. Created custom parameter name for old population, "didSet" observer gives handle on property's old value. ("willSet" Swift generates a newValue parameter. 
        didSet(oldPopulation) {
            print("The population has changed to \(population) from \(oldPopulation)")
        }
    }
    var numberOfStopLights: Int
    init(region: String, population: Int, stopLights: Int) {
        self.region = region
        self.population = population
        numberOfStopLights = stopLights
    }
    // Because no argument for region you provide own value "N/A"
    init(population: Int, stopLights: Int) {
        self.init(region: "N/A", population: population, stopLights: stopLights)
    }
    
    enum Size {
        case small
        case medium
        case large
    }
    
//    // townSize marked as lazy- This means townSize's value will only be calculated when it is first accessed. Marking townSize as lazy indicates to the compiler that this property doesn't need to have a value for "self" to be created, and should instead be created the first time townSize is accessed if it doesn't exist.
//    lazy var townSize: Size = {
//        switch self.population {
//        case 0...10_000:
//            return Size.small
//
//        case 10_001...100_000:
//            return Size.medium
//        // Catches any population over 100_000
//        default:
//            return Size.large
//        }
//    }()
    //^ parenthesese combined with "lazy" marking ensure tat Swift will call the closure and assign the result it returns to townSize when the property is accessed for the first time. Without the parentheses, swift would be assigning a closure to the townSize property.
    
    
     var townSize: Size {
         get {
        switch self.population {
        case 0...10_000:
            return Size.small
            
        case 10_001...100_000:
            return Size.medium
        // Catches any population over 100_000
        default:
            return Size.large
        }
     }
}
    
    func printDescription() {
        print("population: \(population); number of stoplights: \(numberOfStopLights); region: \(region)")
    }
    
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
    
}
