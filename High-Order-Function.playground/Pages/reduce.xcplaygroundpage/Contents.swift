//: [Previous](@previous)
import Foundation
// reduce
// 컨테이너 내부의 컨텐츠를 하나로 합하는 기능을 실행하는 고차함수

let numbers: [Int] = [1, 2, 3]
var sum: Int = numbers.reduce(0, { (result: Int, element: Int) -> Int in
    print("\(result) + \(element)")
    return result + element
})

print(sum)

let subtract: Int = numbers.reduce(0, { (result: Int, element: Int) -> Int in
    print("\(result) - \(element)")
    return result - element
})
print(subtract)

let sumFromThree: Int = numbers.reduce(3) {
    print("\($0) + \($1)")
    return $0 + $1
}
print(sumFromThree)

let subtractFromThree: Int = numbers.reduce(3) {
    print("\($0) - \($1)")
    return $0 - $1
}
print(subtractFromThree)

let names: [String] = ["chope", "jay", "joker", "nova"]

let reduceNames: String = names.reduce("yagom's friend : ") {
    return $0 + ", " + $1
}
print(reduceNames)
//: [Next](@next)
