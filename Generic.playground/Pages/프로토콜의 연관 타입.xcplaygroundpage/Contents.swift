//: [Previous](@previous)

import Foundation

// 프로토콜을 정의할 때 연관타입을 함께 정의하면 유용할 때가 있다.
// 제네릭에서 어떤 타입이 들어올지 모를 때 타입 매개변수를 통해 종류는 알수 없지만, 어떤 타입이 여기에 쓰일것이다라고 표현해주었다면,
// 연관 타입은 타입 매개변수의 그 역할을 프로토콜에서 실행할수 있도록 만들어진 기능

protocol Container {
    associatedtype ItemType
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

class MyContainer: Container {
    var items: Array<Int> = Array<Int>()
    
    var count: Int {
        return items.count
    }
    
    func append(_ item: Int) {
        items.append(item)
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}
//: [Next](@next)
