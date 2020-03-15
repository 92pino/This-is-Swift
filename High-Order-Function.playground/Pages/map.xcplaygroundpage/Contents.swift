import Foundation

// Map
// 자신을 호출할 때 매개변수로 전달된 함수를 실행하여 그 결과를 다시 반환해주는 함수
// 배열, 딕셔너리, 세트, 옵셔널 등에서 사용 가능
// 맵을 사용하면 컨테이너가 담고 있던 각각의 값을 매개변수를 통해 받은 함수에 적용한 후 다시 컨테이너에 포장하여 반환
// 기존 컨테이너의 값은 변경되지 않고 새로운 컨테이너가 생성되어 반환

let numbers: [Int] = [0, 1, 2, 3, 4]

var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

// for 구문 사용
for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}
print(strings)

// map 메서드 사용
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

print(doubledNumbers)
strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})
print(strings)

// 클로저 표현의 간략화
// 기본 클로저 표현식 사용
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

// 매개변수 및 반환 타입 생략
doubledNumbers = numbers.map({ return $0 * 2})
print(doubledNumbers)

// 반환 키워드 생략
doubledNumbers = numbers.map({ $0 * 2 })

// 후행 클로저 사용
doubledNumbers = numbers.map { $0 * 2 }
print(doubledNumbers)



// 클로저의 반복 사용
let evenNumbers: [Int] = [0, 2, 4, 6, 8]
let oddNumbers: [Int] = [0, 1, 3, 5, 7]
let multiplyTwo: (Int) -> Int = { $0 * 2 }

let doubledEvenNumbers = evenNumbers.map(multiplyTwo)

let doubledOddNumbers = oddNumbers.map(multiplyTwo)

// Dictionary map 사용
let alphabetDictionary: [String: String] = ["a":"A", "b":"B"]

var keys: [String] = alphabetDictionary.map { (tuple: (String, String)) -> String in
    return tuple.0
}
keys = alphabetDictionary.map { $0.0 }
print(keys)

let values: [String] = alphabetDictionary.map { $0.1 }
print(keys)
print(values)

// Set map 사용
var numberSet: Set<Int> = [1, 2, 3, 4, 5]
let resultSet = numberSet.map{ $0 * 2 }
print(resultSet)

// optional map 사용
let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map { $0 * 2 }
print(resultInt)

let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map{ $0 * 2 }
print(resultRange)
//: [Next](@next)
