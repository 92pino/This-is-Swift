import UIKit

/*:
 # Collection Type
 
 - Array
 - Set
 - Dictionary
*/

// Array

/*:
 - 배열에 저장할 아이템의 타입에는 제약이 없지만 하나의 배열에 저장하는 아이템 타입은 모두 같아야 한다.
 - 선언 시 배열에 저장할 아이템의 타입을 명확히 정의해아 한다.
 - 배열의 크기는 동적으로 확장할 수 있다.
*/

var cities = ["Seoul", "New York", "LA", "Santiago"]
cities.count

for i in 0..<cities.count {
  print("\(i)번째 배열 원소는 \(cities[i])입니다.")
}

for row in cities {
  print("배열 원소는 \(row)입니다.")
}

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
