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
