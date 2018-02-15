//: Playground - noun: a place where people can play

// Write a program that uses an enumeration and a class, and appropriately handles any generated error conditions:
// 1. An enumeration with at least 3 cases representing custom errors. At least 1 case must have an associated value.
// 2. A class with an initializer and a method that can both throw the custom errors defined in the enumeration.
//
// Use a Swift Playground.

import Darwin

enum AutomobileIssues: Error {
    case noGas(mininumGasQuantity: Double)
    case engineIssues
    case electricIssues
    case noIssues
}


class Car {
    let averageFuelConsumptionLiterPer100KM: Double
    var name: String
    let cost: Double
    var mileage: Double = 0
    var numberOfWheels: Int
    var fuelQuantity: Double = 0
    var carIssues: AutomobileIssues
    
    var description: String {
        return "This Automobile has \(numberOfWheels) wheels, cost \(cost) and has \(mileage) mileage"
    }
    
    var totalFuelConsumed: Double {
        return mileage * averageFuelConsumptionLiterPer100KM / 100
    }
    
    init( _ name: String, _ cost: Double, _ numberOfWheels: Int, _ averageFuelConsumptionLiterPer100KM: Double ) {
        self.name = name
        self.cost = cost
        self.numberOfWheels = numberOfWheels
        self.averageFuelConsumptionLiterPer100KM = averageFuelConsumptionLiterPer100KM
        self.carIssues = .noIssues
    }
    
    convenience init() {
        self.init("[Generic]", 0.0, 4, 20.5)
    }
    
    func drive(distance: Double) throws -> Double {
        switch carIssues {
            case .noIssues: print("Car starts out in good condition")
            default: throw carIssues
        }
        let distanceCanTravel = fuelQuantity / averageFuelConsumptionLiterPer100KM * 100
        if distanceCanTravel <= 0 {
            carIssues = .noGas(mininumGasQuantity: 0)
            throw AutomobileIssues.noGas(mininumGasQuantity: 0)
        }
        let randomCarIssue = Int(arc4random_uniform(20)) + 1   // 10% chance of developing issues during driving
        switch randomCarIssue {
            case 2: carIssues = .engineIssues; throw AutomobileIssues.engineIssues
            case 3: carIssues = .electricIssues; throw AutomobileIssues.electricIssues
            default: break
        }
        let distanceMoved = distance < distanceCanTravel ? distance : distanceCanTravel
        let fuelConsumed = averageFuelConsumptionLiterPer100KM * distanceMoved / 100
        mileage += distanceMoved
        fuelQuantity -= fuelConsumed
        return distanceMoved
    }
    
    func refuel(quantityInLiters quantity: Double) {
        fuelQuantity += quantity;
    }
    
    func fixIssues() {
        carIssues = .noIssues
    }
}

var newCar = Car()
newCar.refuel(quantityInLiters: 50)

do {
    try newCar.drive(distance: 5000)
} catch AutomobileIssues.electricIssues {
    print("Car has circuit issues")
} catch AutomobileIssues.engineIssues {
    print("Car has engine issues")
} catch AutomobileIssues.noGas(let minimumFuelNeeded){
    print("Car has no gas. Gas should be above \(minimumFuelNeeded) liters")
}

do {
    try newCar.drive(distance: 5000)
} catch AutomobileIssues.electricIssues {
    print("Car has circuit issues")
} catch AutomobileIssues.engineIssues {
    print("Car has engine issues")
} catch AutomobileIssues.noGas(let minimumFuelNeeded){
    print("Car has no gas. Gas should be above \(minimumFuelNeeded) liters")
}
