import UIKit

// 익스텐션
// 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있게 해주는 기능
// 타입만 안다면 그 타입의 기능을 확장할 수 있다.

// 타입에 추가할 수 있는 기능
/*
    - 연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
    - 타입 메서드 / 인스턴스 메서드
    - 이니셜라이저
    - 서브스크립트
    - 중첩 타입
    - 특정 프로토콜을 준수할 수 있도록 기능 추가
*/
// 새로운 기능을 추가할 수 있지만, 기존에 존재하는 기능을 재정의할 수 없다.

/*
 extension 확장할 타입 이름 {
    // 타입에 추가될 새로운 기능 구현
 }
 
 extension 확장할 타입 이름: 프로토콜1, 프로토콜2, 프로토콜3 {
    // 프로토콜 요구사항 구현
 }
*/

// 연산 프로퍼티
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven)
print(2.isEven)
print(1.isOdd)
print(2.isOdd)

var number: Int = 3
print(number.isEven)
print(number.isOdd)

number = 2
print(number.isEven)
print(number.isOdd)

// 메서드
extension Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
    
    mutating func multiplySelf(by n: Int) {
        self = self.multiply(by: n)
    }
    
    static func isIntTypeInstance(_ instance: Any) -> Bool {
        return instance is Int
    }
}

print(3.multiply(by: 2))
print(4.multiply(by: 5))

number = 3

number.multiplySelf(by: 2)
print(number)

number.multiplySelf(by: 3)
print(number)

Int.isIntTypeInstance(number)
Int.isIntTypeInstance(3)
Int.isIntTypeInstance(3.0)
Int.isIntTypeInstance("3")

// 전위 연산자
prefix operator ++

struct Position {
    var x: Int
    var y: Int
}

extension Position {
    static func + (left: Position, right: Position) -> Position {
        return Position(x: left.x + right.x, y: left.y + right.y)
    }
    
    static prefix func - (vector: Position) -> Position {
        return Position(x: -vector.x, y: -vector.y)
    }
    
    static func += (left: inout Position, right: Position) {
        left = left + right
    }
}
//: [Next](@next)
