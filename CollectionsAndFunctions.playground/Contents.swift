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

var secondToDoList = [""]

for items in toDoList {
    secondToDoList.append(items)
    secondToDoList.reversed()
    print(secondToDoList)
}


toDoList.reverse()
print(toDoList)
