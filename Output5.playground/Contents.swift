//: Playground - noun: a place where people can play


// Output 5:
// Write a program that uses at least 3 classes:
// 1. A class with at least 3 stored properties, at least 2 computed properties, at least 2 methods, and at least 1 custom initializer.
// 2. A class that inherits from the first class and overrides at least 1 method, 1 property, and 1 initializer.
// 3. A class with both a failable initializer and a deinitializer.
//
// Use a Swift Playground.

class Automobile {
    let averageFuelConsumptionLiterPer100KM: Double
    var name: String
    let cost: Double
    var mileage: Double = 0
    var numberOfWheels: Int
    var fuelQuantity: Double = 0
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
    }
    convenience init() {
        self.init("[Generic]", 0.0, 4, 20.5)
    }
    func drive(distance: Double) -> Double {
        let distanceCanTravel = fuelQuantity / averageFuelConsumptionLiterPer100KM * 100
        let distanceMoved = distance < distanceCanTravel ? distance : distanceCanTravel
        let fuelConsumed = averageFuelConsumptionLiterPer100KM * distanceMoved / 100
        mileage += distanceMoved
        fuelQuantity -= fuelConsumed
        return distanceMoved
    }
    func refuel(quantityInLiters quantity: Double) {
        fuelQuantity += quantity;
    }
    func blowHorn() {
        print("[Generic Automobile Sound]")
    }
}


var genericVehicle = Automobile()
print(genericVehicle.description)
genericVehicle.drive(distance: 20)
genericVehicle.blowHorn()
print(genericVehicle.mileage) // Output is 0.0 because the automobile has no gas
genericVehicle.refuel(quantityInLiters: 10)
genericVehicle.drive(distance: 50)
print(genericVehicle.mileage) // Output is less than 50 because the quantity of gas is not enough to go 50km
print(genericVehicle.totalFuelConsumed)
print(genericVehicle.fuelQuantity)

class Truck: Automobile {
    override var description: String {
        return "This Truck has \(numberOfWheels) wheels, cost \(cost) and has \(mileage) mileage"
    }
    override func blowHorn() {
        print("Ruurrrr Ruuummmmmppp")
    }
    override init(_ name: String, _ cost: Double, _ numberOfWheels: Int, _ averageFuelConsumptionLiterPer100KM: Double) {
        super.init(name, cost, numberOfWheels, averageFuelConsumptionLiterPer100KM)
    }
    convenience init() {
        self.init("[Generic Truck]", 0.0, 16, 10)
    }
}

print(/** Truck **/)
var genericTruck = Truck()
print(genericTruck.description)
genericTruck.drive(distance: 20)
print(genericTruck.mileage) // Output is 0.0 because the truck has no gas
genericTruck.refuel(quantityInLiters: 10)
genericTruck.drive(distance: 75)
genericTruck.blowHorn()
print(genericTruck.mileage)
print(genericTruck.totalFuelConsumed)
print(genericTruck.fuelQuantity)

class Lamborghini: Automobile {
    init? (incomeOfBuyer: Double) {
        if(incomeOfBuyer < 2_500_000) { return nil }
        super.init("Lamborghini", 200000, 4, 17.2)
    }
    override func blowHorn() {
        print("Beeeepppp")
    }
    deinit {
        print("Hello there... Did you just dispose off your Lambo? Everything alright?")
    }
}

var myLambo = Lamborghini(incomeOfBuyer: 20_000_000)
var mySecondLambo = Lamborghini(incomeOfBuyer: 50000)
if let _ = myLambo {
    print("I've got a Lambo")
} else {
    print("I couldn't aford a Lambo")
}
if let _ = mySecondLambo {
    print("I've got a Lambo")
} else {
    print("I couldn't aford a Lambo")
}
myLambo = nil;
