import UIKit

// map
// 기존 데이터를 변형하는데 많이 사용
// 기존 데이터는 변경되지 않고 새로운 데이터가 생성되어 반환된다.

let numbers: [Int] = [0, 1, 2, 3, 4]

let a = numbers.map {
  return "\($0)일"
}
print(a)


let alphabetDictionary: [String: String] = ["a": "A", "b": "B"]

var keys: [String] = alphabetDictionary.map { (tuple: (String, String)) -> String in
  return tuple.0
}

keys = alphabetDictionary.map { $0.0 }

let values: [String] = alphabetDictionary.map { $0.1 }
print(keys, values)

let numberSet: Set<Int> = [1, 2, 3, 4, 5]
let resultSet = numberSet.map { $0 * 2 }
print(resultSet)

let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map { $0 * 2 }
print(resultInt ?? 5)

let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map { $0 * 2 }
print(resultRange)



// filter
// 컨테이너 내부의 값을 걸러서 추출하는 역할
// 반환 타입은 Bool (컨테이너에 포함될 항목이라고 판단하면 true, 포함하지 않으면 false)

let numbers2: [Int] = [0, 1, 2, 3, 4, 5]

let evenNumbers: [Int] = numbers2.filter { $0 % 2 == 0 }
print(evenNumbers)

let oddNumbers: [Int] = numbers2.filter { $0 % 2 != 0 }
print(oddNumbers)

let mappedNumbers: [Int] = numbers2.map { $0 + 3 }.filter { $0 % 2 == 0 }
print(mappedNumbers)

let mapOddNumbers: [Int] = numbers2.map { $0 + 3 }.filter { $0 % 2 != 0 }
print(mapOddNumbers)


// reduce
// 컨테이너 내부의 콘텐츠를 하나로 합치는 기능을 실행하는 고차함수

let reduceNum: [Int] = [0, 1, 2, 3, 4, 5]

var sum: Int = reduceNum.reduce(0) { (result: Int, element: Int) -> Int in
  print("\(result) + \(element)")
  return result + element
}

print(sum)

let subtract: Int = reduceNum.reduce(0) { (result: Int, element: Int) -> Int in
  print("\(result) - \(element)")
  return result - element
}

print(subtract)

let sumFromThree: Int = reduceNum.reduce(3) {
  print("\($0) + \($1)")
  
  return $0 + $1
}

print(sumFromThree)

let names: [String] = ["Chope", "Jay", "Joker", "Nova"]

let reducedNames: String = names.reduce("pino's friend : ") {
  return $0 + ", " + $1
}

print(reducedNames)
