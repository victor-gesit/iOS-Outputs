//: Playground - noun: a place where people can play


// Using a Swift playground, write a program that combines an array of dictionaries into a single dictionary such that the value associated with each key is a _set_ containing the unique values associated with that key in the input dictionaries. The program should then print out the _sorted_ results in human-readable form.


let daysInMonths = ["January": "31", "February": "27", "March": "31", "April": "30"]
let monthsAndSeason = ["January": "Summer", "February": "Summer", "March": "Autumn", "April" : "Autumn" ] // https://www.calendar-365.com/seasons.html
let monthsAndHolidays = ["January": "New Year's Day", "February": "Lovers Day", "March": "Women's Day", "April": "Fools Day"]

let input: [[String: String]] = [daysInMonths, monthsAndSeason, monthsAndHolidays]


// Expected result = ["January": Set(["31", "Summer", "New Year Day"]), "February": Set(["27", "Summer", "Lover's Day"]), "March": Set(["31", "Autumn", "Women's Day"]), "April": Set(["30", "Autumn", "Fool's Day"])]

func restructureDictionary (input: [[String: String]]) {
    var result = [String: Set<String>]()
    for dictionary in input {
        for (key, value) in dictionary {
            if let _ = result[key] {
                result[key]?.insert(value)
            } else {
                var newSet = Set<String>()
                newSet.insert(value)
                result[key] = newSet
            }
        }
    }
    for (key, value) in result.sorted(by: { (set1: (String, Set<String>), set2: (String, Set<String>)) -> Bool in
        let monthIndices = ["January": 1, "February": 2, "March": 3, "April":4]
        var comesBefore:Bool = false
        if let key1 = monthIndices[set1.0], let key2 = monthIndices[set2.0] {
            comesBefore = key1 < key2
        }
        return comesBefore
    }) {
        print("\(key): ", terminator: " ")
        for info in value {
            print(info, terminator: ", ")
        }
        print()
    }
}
restructureDictionary(input: input)
