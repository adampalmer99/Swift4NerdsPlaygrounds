import Cocoa

var myFirstInt: Int = 0

//for i in 1...5 {
//    myFirstInt += +1
//    myFirstInt
//    print(myFirstInt)
//}

//for i in 1...5 {
//    myFirstInt += +1
//    myFirstInt
//    print("myFirstInt equals \(myFirstInt) at iteration \(i)")
//}

//MARK: - for-in loop with where clause
//the where clause chwcks whether i is divisible by 3, if remainder is 0 loop executes the code

for i in 1...100 where i % 3 == 0 {
    print(i)
}

//MARK: - While loops
// while loops execute the code inside its body as long as a condition is true

var i = 1
while i < 6 {
    myFirstInt += 1
    print(myFirstInt)
    i += 1
}

//MARK: - repeat-while loops
// the repeat-while loop executes its loop at least once and then evaluates its condition
//var shields: Int = 0
//
//repeat {
//    // Fire Blasters
//    print("Fire blasters!")
//} while shields > 0


//MARK: - Control transfer statements, redux

//var shields = 5
//var blastersOverheating = false
//var blasterFireCount = 0
//
//while shields > 0 {
//
//    if blastersOverheating {
//        print("Blasters overheated! Cooldown initiated.")
//        sleep(5)
//        print("blasters ready to fire")
//        sleep(1)
//        blastersOverheating = false
//        blasterFireCount = 0
//    }
//
//    if blasterFireCount > 100 {
//        blastersOverheating = true
//        continue
//    }
//    // Fire Blasters!
//    print("fire blasters!")
//
//    blasterFireCount += 1
//
//}
