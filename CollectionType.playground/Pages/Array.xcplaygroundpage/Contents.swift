import UIKit

/*:
 # Collection Type
 
 - Array
 - Set
 - Dictionary
*/

// Array

var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
someInts = []
print(someInts)

var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

var shoppingList: [String] = ["Eggs", "Milk"]

var shoppingList2 = ["Eggs", "Milk"]
print(shoppingList2.count)

if(shoppingList2.isEmpty) {
  print(1111)
} else {
  print(2222)
}

shoppingList2.append("Four")
print(shoppingList2.count)

shoppingList2 += ["Baking Powder"]
print(shoppingList2)

for item in shoppingList2 {
  print(item)
}

// 배열의 값과 인덱스가 필요할 경우에는 enumerated를 사용
for (index, value) in shoppingList2.enumerated() {
  print("Item \(index + 1): \(value)")
}

//: [Next](@next)
