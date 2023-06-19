import UIKit

var array1 = [1, 2, 3, 4, 6, 7, 8, 9, 10]
var array2 = [1, 2, 3, 4, 5, 6]

var temp = [Int]()
for item1 in array1 {
    for item2 in array2 {
        if item2 == item1 {
            temp.append(item1)
        }
    }
}

print(temp)
