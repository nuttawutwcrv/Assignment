import UIKit

// Input

var number: NSNumber = 172839


//MARK: - Sub Validate function

func hasRepeatNumber(_ value: [Int], limit: Int = 2) -> Bool {
    
    var stack = 1
    var prev = -1
    
    for item in value {
        if item == prev {
            stack += 1
        } else {
            stack = 1
        }
        if stack > limit {
            return true
        }
        prev = item
    }
    return false
}

func hasConsecutiveNumber(_ value: [Int], limit: Int = 2) -> Bool {
    
    var stack = 0
    var prev = -2
    
    for item in value {
        
        if prev == item - 1 || prev == item + 1 {
            stack += 1
        } else if prev == item + 1 {
            stack -= 1
        } else {
            stack = 0
        }
        if abs(stack) >= limit {
            return true
        }
        prev = item
    }
    return false
}

func hasGroupExistNumber(_ value: [Int], digitLimit: Int = 2, groupLimit: Int = 2) -> Bool {
    
    var group = 0
    var stack = 1
    var prev = -1
    
    for item in value {
        if item == prev {
            stack += 1
        } else {
            stack = 1
        }
        if stack >= digitLimit {
            group += 1
        }
        if group > groupLimit {
            return true
        }
        prev = item
    }
    return false
}


//MARK: - Main Validate function

func validate(_ number: NSNumber) -> Bool {
    
    guard number.stringValue.count == 6 else {
        return false
    }
    
    let array = number.stringValue.compactMap({$0.wholeNumberValue})
    
    guard !hasRepeatNumber(array) else {
        return false
    }

    guard !hasConsecutiveNumber(array) else {
        return false
    }
    
    guard !hasGroupExistNumber(array) else {
        return false
    }
    return true
}

if validate(number) {
    print("Number is valid")
} else {
    print("Number is invalid")
}
