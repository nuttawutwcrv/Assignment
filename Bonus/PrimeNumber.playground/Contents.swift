import UIKit

func prime(_ max: Int) -> [Int] {
    
    var sequence = [Int]()
    for i in 1...max {
        
        if (i > 1 && !(2..<i).contains { i % $0 == 0 }){
            sequence.append(i)
        }
    }
    return sequence
}

print(prime(50))



