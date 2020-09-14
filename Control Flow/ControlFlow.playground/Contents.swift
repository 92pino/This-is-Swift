import Cocoa

/*:
 ## for...in
 */
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
  print("Hello, \(name)")
}

// Dictionary에 담긴 컨텐츠는 정렬되지 않은 상태여서 순서대로 순회하지 않는다.
let numberOfLegs = ["Spider": 8, "Ant": 6, "Cat": 4]
for (animalName, legCount) in numberOfLegs {
  print("\(animalName)s have \(legCount) legs")
}

// 굳이 순서대로 제어할 필요가 없다면 변수 대신 _를 사용하면 성능을 높일수 있다.
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
  answer *= base
}

print("\(base) to the power of \(power) is \(answer)")


/*:
 ## While
 조건이 거짓일때까지 구문을 반복
 ```swift
 while condition {
 statements
 }
 ```
 
 ## Repeat-While
 statements를 최소 한번 이상 실행하고 while 조건이 거짓일 때까지 반복
 ```swift
 repeat {
 statements
 } while condition
 ```
 */

let someCharacter: Character = "z"
switch someCharacter {
case "a":
  print("The first letter of the alphabet")
case "z":
  print("The last letter of the alphabet")
default:
  print("Some other character")
}

let anotherCharacter: Character = "a"

switch anotherCharacter {
case "a", "A":
  print("The letter A")
default:
  print("Not the letter A")
}

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
  naturalCount = "no"
case 1..<5:
  naturalCount = "a few"
case 5..<12:
  naturalCount = "several"
case 12..<100:
  naturalCount = "dozens of"
case 100..<1000:
  naturalCount = "hundreds of"
default:
  naturalCount = "many"
}

if #available(iOS 10, macOS 10.12, *) {
  // iOS 10, macOS 10.12 일 경우에만 호출
} else {
  // iOS 10, macOS 10.12가 아닐 경우 호출
}
