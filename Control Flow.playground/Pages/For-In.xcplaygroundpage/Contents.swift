import UIKit

/*:
 # For-In 문
 
 For-in 문은 배열, 숫자, 문자열을 순서대로 순회 하기 위해 사용
 
*/
for row in 1...5 {
  print(row)
}

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
  print("Hello, \(name)")
}

let numberOfLegs = ["Spider": 8, "Ant": 6, "Cat": 4]
for (animalName, legCount) in numberOfLegs {
  print("\(animalName)s have \(legCount) legs")
}

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}

let minutes = 60
for tickMark in 0..<minutes {
  print(tickMark)
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
  print(tickMark)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
  print(tickMark)
}
//: [Next](@next)
