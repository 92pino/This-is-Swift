//: [Previous](@previous)

import Foundation

extension Stack {
    var topElement: Element? {
        return self.items.last
    }
}

// 타입 제약
// 만약 뺄셈 연산을 하고싶을 경우 제네릭에 제대로된 타입이 들어가지 않는것을 방지
func substractTwoValue<T>(_ a: T, _ b: T) -> T {
    return a - b
}

// 수정
func substractTwoValue2<T: BinaryInteger>(_ a: T, _ b: T) -> T {
    return a - b
}

// 타입 제약에 자주 사용할 만한 프로토콜에는
/*
    - Hashable
    - Equatable
    - Comparable
    - Indexalbe
    - IteratorProtocol
    - Error
    - Collection
    - CustomStringConvertible 등등...
*/
//: [Next](@next)
