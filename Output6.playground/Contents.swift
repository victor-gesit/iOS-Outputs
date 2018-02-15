//: Playground - noun: a place where people can play

// Output 6:
// Write a program that uses two protocols and two extensions:
// 1. A protocol with at least 1 property, 1 method, and 1 initializer.
// 2. An extension to a standard Swift library type that provides conformance to the first protocol.
// 3. A protocol that specifies at least 2 properties (1 gettable and settable, 1 gettable only) and 2 methods.
// 4. An extension to the second protocol that provides default implementations for at least 1 property and 1 method.
//
// Use a Swift Playground.

import Darwin


enum PowersOfTen {
    case pico, nano, micro, milli, deci, deca, hecto, kilo, mega, giga, tera
}

protocol Converter {
    var pico: Double { get }
    var nano: Double { get }
    var micro: Double { get }
    var milli: Double { get }
    var deci: Double { get }
    var deca: Double { get }
    var kilo: Double { get }
    var mega: Double { get }
    var giga: Double { get }
    var tera: Double { get }
    var unit: String { get set }
    var aUnit: String { get }
    var valueWithUnit: String { get }
    mutating func convert(to: PowersOfTen) -> Double?
    init()
    init(unit: String)
}

extension Double: Converter {
    var pico: Double { return self * 1e-12}
    var nano: Double { return self * 1e-9}
    var micro: Double { return self * 1e-6}
    var milli: Double { return self * 1e-3}
    var deci: Double { return self * 1e-1}
    var deca: Double { return self * 1e1}
    var kilo: Double { return self * 1e3}
    var mega: Double { return self * 1e6}
    var giga: Double { return self * 1e9}
    var tera: Double { return self * 1e12}
    var aUnit: String { return "meters" }

    var unit: String {
        get {
            return "meters"
        }
        set {
            print("Getting set, \(newValue) ") // This line is supposed to set the unit property to the 'newValue'
        }
    }

    var valueWithUnit: String { return "\(self.description)_\(unit)"}

    func convert(to: PowersOfTen) -> Double? {
        var result: Double
        switch to {
            case .pico: result = self.tera
            case .nano: result = self.giga
            case .micro: result = self.mega
            case .milli: result = self.kilo
            case .deci: result = self.deca
            case .deca: result = self.deci
            case .kilo: result = self.milli
            case .mega: result = self.micro
            case .giga: result = self.nano
            case .tera: result = self.pico
            default: return nil
        }
        return result
    }

    init(unit: String) {
        self.init()
        self.unit = unit;
        print(unit, self.unit)
    }
}
var aThousand = 1.0.kilo

print(aThousand) // Output is 1000.0

if let aThousandToMega = aThousand.convert(to: .mega) {
    print(aThousandToMega) // Output is 0.001
    print(aThousandToMega.valueWithUnit) // Output is 0.001_meters
}

var grammes = Double(unit: "grammes")
grammes = 25;
print("me", grammes.valueWithUnit)

protocol CanFly {
    var name: String { get }
    var description: Double { get set}
    func accelerate() -> Double
    func makeSound() -> String
}

extension CanFly {
    var name: String {
        return "Bird"
    }
    func makeSound() -> String {
        return "Chirp...."
    }
}
