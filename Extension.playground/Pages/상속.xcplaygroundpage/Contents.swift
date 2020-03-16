import Foundation
//: [Previous](@previous)
// 상속
// 클래스는 메서드나 프로퍼티 등을 다른 클래스로부터 상속 받을 수 있다.
// 어떤 클래스로부터 상속을 받으면 상속받은 클래스는 그 어떤 클래스의 자식클래스라고 표현
// 자식클래스에게 자신의 특성을 물려준 클래스를 부모클래스라고 표현

// 다른 클래스로부터 상속받지 않는 클래스를 기반 클래스라고한다.

// 상속이란 것은 기반클래스를 다른 클래스에서 물려받는 것을 말한다.
/*
    class 클래스 이름: 부모클래스 이름 {
        프로퍼티와 메서드
    }
*/

class Person {
    var name: String = ""
    var age: Int = 0
    
    var introduction: String {
        return "이름 : \(name). 나이 : \(age)"
    }
    
    func speak() {
        print("가나다라마바사")
    }
}

let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 99
print(yagom.introduction)
yagom.speak()

class Student: Person {
    var grade: String = "F"
    
    func study() {
        print("Study hard...")
    }
}

let yagom2: Person = Person()
yagom2.name = "yagom"
yagom2.age = 99
print(yagom2.introduction)
yagom2.speak()
//: [Next](@next)
