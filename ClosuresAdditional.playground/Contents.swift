import Cocoa

// Sorting the Array

let volunteerCounts = [1,3,40,32,2,53,77,13]

func sortAscending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}
let volunteersSorted = volunteerCounts.sorted(by: sortAscending)


//MARK: - Closures Expression Syntax
// {(parameters) -> return type in
    // code
//}

//MARK: - Refactoring sorting code

let volunteersSorted2 = volunteerCounts.sorted(by: {(i: Int, j: Int) -> Bool in return i < j})

// Type inference
let volunteersSortedTI = volunteerCounts.sorted(by: {i, j in i < j })

// using shorthand syntax for arguments
let volunteersSortedSH = volunteerCounts.sorted {$0 < $1}


//MARK: - Functions as Return Types
// makeTownGrand doesn't take any arguments, it returns a function. The function takes 2 arguments, both integers and returns and integer. Inside makeTownGrand() the function returned is implemented.

//func makeTownGrand() -> (Int, Int) -> Int {
//    func buildRoads(byAddingLights lights: Int, toExistingLights existingLights: Int) -> Int {
//        return lights + existingLights
//    }
//    return buildRoads
//}
//var stopLights = 4
//let townPlanByAddingLightsToExistingLights = makeTownGrand()
//stopLights = townPlanByAddingLightsToExistingLights(4, stopLights)
//print("Knowhere has \(stopLights) stoplights")


//MARK: - Functions as Arguments
// new makeTownGrand takes 2 arguments, first is an instance oftype Int representing town budget, second called condition and takes a function, the function determines whether the budget is high enough, it takes an Int and returns a Bool. if Integer budget is high enough this function will return true, if not it returns false.
// An optional is needed as if the budget is not sufficient, buildRoads(byAddingLights: toExistingLights) won't be created and nil will be returned. Optional needed to handle the possibility of a nil return


func makeTownGrand(withBudget budget: Int, condition: (Int) -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
    func buildRoads(byAddingLights lights: Int, toExistingLights existingLights: Int) -> Int {
        return lights + existingLights
    }
    return buildRoads
    } else {
        return nil
    }
}
func evaluate(budget: Int) -> Bool {
    return budget > 10_000
}

var stoplights = 4

if let townPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 1_000, condition: evaluate) {
    stoplights = townPlanByAddingLightsToExistingLights(4, stoplights)
}
print("Knowhere has \(stoplights) stoplights")

// Building more roads

if let newTownPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 10_500, condition: evaluate) {
    stoplights = newTownPlanByAddingLightsToExistingLights(4, stoplights)
}
print("Knowhere has \(stoplights) stoplights")


//MARK: - Closures capture values

func makePopulationTracker(forInitialPopulation population: Int) -> (Int) -> Int {
    var totalPopulation = population
    func populationTracker(growth: Int) -> Int {
        totalPopulation += growth
        return totalPopulation
    }
    return populationTracker
}

var currentPopulation = 5_422
let growBy = makePopulationTracker(forInitialPopulation: currentPopulation)
growBy(500)
growBy(500)
growBy(500)
currentPopulation = growBy(500) // currentPopulation is now 7422

// Closures are Reference Types

let anotherGrowBy = growBy
anotherGrowBy(500) // totalPopulation now equal to 7922


// Another population to track
var bigCityPopulation = 4_061_981
let bigCityGrowBy = makePopulationTracker(forInitialPopulation: bigCityPopulation)
bigCityPopulation = bigCityGrowBy(10_000)
bigCityPopulation // bigCityPopulation now 4071981



//MARK: - FUNCTIONAL PROGRAMMING
// Includes:
// FIRST-CLASS FUNCTIONS- functions can be returned from and passed as arguments to other functions. can be stored in variables, etc.; they are just like any other type.

// PURE FUNCTIONS- functions have no side effects; functions, given the same input, always returns the same output and do not modify other states elsewhere in the program. Most math functions like sin, cos, fibonacci, and factorial are pure.

// IMMUTABILITY- mutability is de-emphasised as it is more dificult to reason about data whose values can change.

// STRONG TYPING- A strong type system increases the runtime safety of the code because the guarantees of the language's type system are hecked at compile time.

// ^Swift supports all of these approaches.


//MARK: - Higher-order functions

// higher-order functions take at least one function as an input. examples- sorted(by:), map(_:), filter(_:), reduce(_: _:)


// map(_:) is a function that can be used to transform an arrays contents. You map an arrays contents from one value to another and put these new values into a new array. Because map(_:) is a higher-order function, you provide it with another function that tells it how to transform the array's contents.


let precinctPopulations = [1224, 2021, 2157]

let projectedPopulations = precinctPopulations.map {
    (population: Int) -> Int in return population * 2
}
projectedPopulations


// filter(_:)
// filter(_:) can be called on an instance of the Array type. Also takes a closure expression as an argument. It's purpose is to FILTER an array based on some criteria. The resulting array will contain the values of the original array that passed the test.

let bigProjections = projectedPopulations.filter {
    (projection: Int) -> Bool in return projection > 4000
}
bigProjections


// reduce(_:_:)
// Reduce can be called on an instance of an Array type, it's job is to reduce the values in the collection to a single value that's returned from the function.

let totalProjection = projectedPopulations.reduce(0) {
    (accumulatedProjection: Int, precinctProjection: Int) -> Int in return accumulatedProjection + precinctProjection
}
