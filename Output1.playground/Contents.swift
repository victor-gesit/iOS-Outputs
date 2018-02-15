//: Playground - noun: a place where people can play


//  Using a Swift playground, write a program that iterates over an arbitrary range of integers and
//  prints descriptive phrases for each.
//  Use at least one `switch` statement.

// First solution
func responsibilities (age: Int) -> String? {
    let responsibilities: [String: String] = ["kid": "Wants to be taken care of",
    "teen": "Doesn't want to be taken care of and doesn't want to take care of anyone",
    "adult": "Takes care of everyone else, including self",
    "granny": "Tells people to take care, but is taken care of"]
    var responsiblity: String?
    switch age {
        case 0..<13: responsiblity = responsibilities["kid"]
        case 13..<19: responsiblity = responsibilities["teen"]
        case 20..<60: responsiblity = responsibilities["adult"]
        case 60..<95: responsiblity = responsibilities["granny"]
        default: return "Age is out of range"
    }
    return responsiblity
}

if let responsibility = responsibilities(age: 90) {
  print(responsibility)
}

// Second Solution

func talkingNumbers(number: Int) {
    for integer in 1...number {
        var aboutMe: String = "I am the number \(integer)"
        switch integer {
            case let x where x % 2 == 0: aboutMe += ", I am even"
            case let x where x % 2 != 0: aboutMe += ", I am odd"
            case let x where x > 0: aboutMe += ", I am positive"
            case let x where x < 0: aboutMe += ", I am negative"
            default: break
        }
        switch integer {
            case let x where x > 0: aboutMe += ", I am positive"
            case let x where x < 0: aboutMe += ", I am negative"
            default: break
        }
        aboutMe += ", and I'd like to be your friend"
        print(aboutMe)
    }
}
talkingNumbers(number: 5)


