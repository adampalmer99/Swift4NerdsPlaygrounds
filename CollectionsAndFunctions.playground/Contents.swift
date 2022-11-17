import Cocoa

//MARK: - Accessing and modifying Arrays

var bucketList = ["Climb a mountain"]

// Adding to Array
bucketList.append("Fly plane")
bucketList.append("Visit Colombia")
bucketList.append("Scuba dive")
bucketList.append("Drive Route 66")
bucketList.append("Learn to play piano")
bucketList.append("Learn to cook")

// Removing from Array
bucketList.remove(at: 2) // Vist Colombia
bucketList

// Counting items in Array
print(bucketList.count)

// Subscripting top 3 items
print(bucketList[0...2])

// Subscripting to append new info
bucketList[2] += " in Australia"
print(bucketList)

// replacing an Array item
bucketList[0] = "Climb mt. Everest"
bucketList


var secondBucketList = ["Ski in Canada"]

var newItems = [
"Fly hot air balloon",
"Watch LOTR in one day",
"Visit Los Angeles",
"Visit a Scandinavian country",
"Win the lottery"
]

// Using a loop to append items from one array to another

//for item in newItems {
//    secondBucketList.append(item)
//}
print(secondBucketList)

// Refactoring with the addition and assignment operator +=

secondBucketList += newItems
print(secondBucketList)

// Inserting a new ambition

secondBucketList.insert("Visit the pyramids", at: 1)
print(secondBucketList)

//MARK: - Array Equality

var terrysList = [
"Ski in Canada",
"Win the lottery",
"Visit the pyramids",
"Fly hot air balloon",
"Visit a Scandinavian country",
"Watch LOTR in one day",
"Visit Los Angeles"
]

let equal = (secondBucketList == terrysList)
// False because the order is different. ARRAYS ARE ORDERED!!

//MARK: - Immutable Arrays

let lunches = [
"Cheeseburger",
"Veggie Pizza",
"Chicken Caesar Salad",
"Black Bean Burrito",
"Falafel Wrap"
]
// LET keyword creates the immutable array
// CANNOT MUTATE AN IMMUTABLE ARRAY

//MARK: - Bronze Challenge page 94
// Use the documentation to locate a var defined on the array type that will tell you whether toDoList contains any elements

var toDoList = ["Take out garbage", "Pay bills", "Cross off finished items"]
print(toDoList.isEmpty)

//MARK: - silver challenge
// Use a loop to reverse the order of the elements in toDoList and log results to console, and find easier way to do it

// without using .reverse
var reversedTodoList = [String]()
var totalIndices = toDoList.count - 1

for arrayIndex in 0 ... totalIndices {
    reversedTodoList.append(toDoList[totalIndices - arrayIndex])
}

// using reverse

for item in toDoList.reversed() {
    print(item)
}

toDoList.reverse()
print(toDoList)


//MARK: - Dictionaries

// Creating dictionary
var movieRatings = ["Donnie Darko": 4, "Pineapple Express": 3, "Pulp Fiction": 5]

print("I have rated \(movieRatings.count) movies.")

let donnieDarkoRating = movieRatings["Donnie Darko"]
// Returns optional Int(Int?) because movieRatings is subscripted, this syntax asks the dictionary for the value associated with string key "Donnie Darko"
// When subscripting a dictionary's instance for a given key, the dictionary will return an optional matching the type of the dictionary's values.

// Modifying a value

movieRatings["Pineapple Express"] = 4
movieRatings

// Updating a value

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

// Adding and removing values

movieRatings["The Cabinet of Dr. Cagliari"] = 5

//movieRatings.removeValue(forKey: "Pineapple Express")
// Setting key's value to nil
movieRatings["Pineapple Express"] = nil

//MARK: - Looping through dictionary

for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value)")
}

for movie in movieRatings.keys {
    print("User has rated \(movie)")
}


//MARK: - Immutable Dictionaries

// Can't change this dictionary

let album = [
    "Diet Roast Beef": 268,
    "Dubba Dubbs Stubs His Toe": 467,
    "Smokey's Carpet Cleaning Service": 187,
    "Track 4": 221]

//Cannot use mutating member on immutable value: 'album' is a 'let' constant
//Change 'let' to 'var' to make it mutable
//album.removeValue(forKey: "Track 4")


//MARK: - Translating Dictionary to an Array

let watchedMovies = Array(movieRatings.keys)
print(watchedMovies)

