//: Playground - noun: a place where people can play

// Write a Swift program that uses an enumeration, a mutable structure, and an immutable structure.

extension Double {
    var cents: Double {
        return self / 100
    }
    var dollars: Double {
        return self
    }
}

// Enumeration
enum PowerState {
    case on, off
}

enum MainsVoltage: String {
    case v230f50 = "220V, 50Hz"
    case v120f60 = "120V, 60Hz"
}

// Immutable structure
struct PowerSource {
    var mainsVoltage: MainsVoltage
    var costPerKWH: Double
    var description: String {
        return "This power source is \(mainsVoltage.rawValue) and costs \(costPerKWH) dollars per KWH"
    }
}

// Mutable structure
struct HomePower {
    var powerSources = [PowerSource]()
    var currentPowerSourceIndex: Int {
        didSet {
            print("Power source changed...")
        }
    }
    var powerState: PowerState
    mutating func switchSource () -> PowerSource? {
        if powerSources.count <= 1 {
            return nil
        }
        let newPowerSourceIndex = (currentPowerSourceIndex + 1) % powerSources.count
        currentPowerSourceIndex = newPowerSourceIndex
        return powerSources[currentPowerSourceIndex]
    }
    mutating func togglePower() {
        powerState = .off
    }
    mutating func addPowerSource(powerSource: PowerSource) {
        powerSources.append(powerSource)
    }
    func currentPowerSource() -> PowerSource? {
        return powerSources[currentPowerSourceIndex]
    }
    init(powerSource: PowerSource) {
        powerSources.append(powerSource)
        powerState = .on
        currentPowerSourceIndex = 0
    }
}


// Usage
let windPower = PowerSource(mainsVoltage: .v120f60, costPerKWH: 10.0.cents)
let nuclearPower = PowerSource(mainsVoltage: .v230f50, costPerKWH: 8.0.cents)
var epicTowerPower = HomePower(powerSource: windPower)
epicTowerPower.addPowerSource(powerSource: nuclearPower)
print("The power at Epic Tower is \(epicTowerPower.powerState)")
if let etPowerSource = epicTowerPower.currentPowerSource() {
    print(etPowerSource.description)
} else {
    print("No power at ET")
}
epicTowerPower.togglePower()
print("The power at Epic Tower is \(epicTowerPower.powerState)")
epicTowerPower.switchSource()
print(epicTowerPower.currentPowerSource()!.description)
epicTowerPower.switchSource()
print(epicTowerPower.currentPowerSource()!.description)

