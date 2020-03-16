import Foundation
//: [Previous](@previous)
// 필터
// 컨테이너 내부의 값을 걸러서 추출하는 역할을 하는 고차함수

let numbers: [Int] = [0, 1, 2, 3, 4, 5]

let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)

let oddNumbers: [Int] = numbers.filter { $0 % 2 != 0 }
print(oddNumbers)

let mappedNumbers: [Int] = numbers.map{ $0 + 3 }

let evenNumbers2: [Int] = mappedNumbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}

print(evenNumbers2)

let oddNumbers2: [Int] = numbers.map { $0 + 3 }.filter{ $0 % 2 != 0 }
print(oddNumbers2)
//: [Next](@next)
