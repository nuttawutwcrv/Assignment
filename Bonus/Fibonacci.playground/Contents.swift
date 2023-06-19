import UIKit

func fibonacci(_ n: Int) -> [Int] {
    
    guard n > 1 else {
        return []
    }

    var sequence = [Int]()
    var number1 = 0
    var number2 = 1
    sequence.append(number1)
    sequence.append(number2)
    
    for _ in 0..<n {
        let result = number1 + number2
        number1 = number2
        number2 = result
        sequence.append(result)
    }
    return sequence
}

print(fibonacci(10))
