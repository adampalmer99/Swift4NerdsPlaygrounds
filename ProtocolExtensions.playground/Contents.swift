import Cocoa

protocol Exercise {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}

struct EllipticalWorkout: Exercise {
    let name = "Elliptical Workout"
    let caloriesBurned: Double
    let minutes: Double
}

let ellipticalWorkout = EllipticalWorkout(caloriesBurned: 335, minutes: 30)

struct TreadmillWorkout: Exercise {
    let name = "Treadmill Workout"
    let caloriesBurned: Double
    let minutes: Double
}

let runningWorkout = TreadmillWorkout(caloriesBurned: 350, minutes: 25)

//MARK: - Extending Exercise

//func caloriesBurnedPerMin<E: Exercise>(for exercise: E) -> Double {
//    return exercise.caloriesBurned / exercise.minutes
//}
//
//print(caloriesBurnedPerMin(for: ellipticalWorkout))
//print(caloriesBurnedPerMin(for: runningWorkout))


extension Exercise {
    var caloriesBurnedPerMin: Double {
        return caloriesBurned / minutes
    }
}

extension Sequence where Iterator.Element == Exercise {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [Exercise] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurned())
