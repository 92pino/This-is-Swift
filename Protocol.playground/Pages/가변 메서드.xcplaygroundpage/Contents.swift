import Foundation
//: [Previous](@previous)
// 인스턴스 내부의 값을 변경해야 하는 메서드를 요구하려면 프로토콜의 메서드 앞에 mutating을 명시해야한다.
// 클래스의 경우 mutating을 명시 안해줘도 상관없지만 값 타입인 구조체나 열거형에서는 mutating을 붙인 가변 메서드 요구가 필요하다

protocol Resettable {
    mutating func reset()
}

class Person: Resettable {
    var name: String?
    var age: Int?
    
    func reset() {
        self.name = nil
        self.age = nil
    }
}

struct Point: Resettable {
    var x: Int = 0
    var y: Int = 0
    
    mutating func reset() {
        self.x = 0
        self.y = 0
    }
}

enum Direction: Resettable {
    case east, west, south, north, unknown
    
    mutating func reset() {
        self = Direction.unknown
    }
}
//: [Next](@next)
