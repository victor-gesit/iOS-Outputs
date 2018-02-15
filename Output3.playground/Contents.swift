//: Playground - noun: a place where people can play

// Output 3:
// Write a dictionary program with at least three functions that allow the user to look-up values in a dictionary and return them in human-readable form, and then traverse the dictionary to print out each value in each set.

// Use a Swift playground as your tools. Use a trailing closure in your code when you are traversing the dictionary such that the closure is called once for each key and value within the associated sets.


var andelaLocations = ["Nigeria": "Lagos", "Kenya": "Nairobi", "Uganda": "Kampala" ]


func traverseDict(dictionary: [String: String],traversingFunc: (String, String) -> Void ){
    for (key, value) in dictionary {
        traversingFunc(key, value)
    }
}

func officeLocationPrinter(country: String, city: String) {
        print("Andela has an office in \(country). It is located in the city of \(city)")
}

traverseDict(dictionary: andelaLocations) { officeLocationPrinter(country: $0, city: $1) }
