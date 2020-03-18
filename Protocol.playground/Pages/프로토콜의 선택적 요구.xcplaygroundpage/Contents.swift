import Foundation
//: [Previous](@previous)
// @objc 선택적 요구사항 프로토콜
// @objc 속성을 부여하여 필요한 프로토콜만 사용하는 것
// 클래스에서만 사용 가능하며 구조체, 열거형에서는 채택할 수 없다.


@objc protocol Moveable {
    func walk()
    @objc optional func fly()
}

class Tiger: NSObject, Moveable {
    func walk() {
        print("Tiger walks")
    }
}

class Bird: NSObject, Moveable {
    func walk() {
        print("Bird walks")
    }
    
    func fly() {
        print("Bird flys")
    }
}

let tiger: Tiger = Tiger()
let bird: Bird = Bird()

tiger.walk()
bird.walk()
bird.fly()

var MoveableInstance: Moveable = tiger
MoveableInstance.fly?()

MoveableInstance = bird
MoveableInstance.fly?()
//: [Next](@next)
