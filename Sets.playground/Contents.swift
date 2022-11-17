import Cocoa

// A SET is an unordered collection of distinct instances. A set cannot have [2,2,2,2] but an ARRAY can.

// Creating a Set
var groceryBag = Set(["Apples", "Oranges", "Pineapple"])


// Adding to a Set
//groceryBag.insert("Apples")
//groceryBag.insert("Oranges")
//groceryBag.insert("Pineapple")

// Looping through a Set

for food in groceryBag {
    print(food)
}

// .contains in Sets

let hasBanana = groceryBag.contains("Bananas")

//MARK: - UNIONS

// Combining Sets

let friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
let commonGroceryBag = groceryBag.union(friendsGroceryBag)

//MARK: - Intersections

let roommatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersection(roommatesGroceryBag)


//MARK: - Disjoint
// isDisjointed returns true or false depending on whether any items have been repeated

let yourSecondBag = Set(["Berries", "Yoghurt"])
let roommatesSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjoint(with: roommatesSecondBag)

//MARK: - Bronze Challenge
// Find a method on Set that returns a bool indicating whether myCities contains all of the cities contained by yourCities

let myCities = Set(["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"])
let yourCities = Set(["Chicago", "Atlanta", "Jacksonville"])

myCities.isSuperset(of: yourCities)


//MARK: - Silver Challenge page- 109


var groceryBag2 = Set(["Apples", "Oranges", "Pineapple"])
var friendsGroceryBag2 = Set(["Bananas", "Cereal", "Milk", "Oranges"])

groceryBag2.formUnion(friendsGroceryBag2)

print(groceryBag2)
