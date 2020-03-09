//: [Previous](@next)

/*:
 
 # 클래스
 - 참조 타입
 
 ```Swift
 class 클래스 이름: 부모클래스 이름 {
    프로퍼티와 메서드
 }
 ```
 */

import Foundation

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var yagom: Person = Person()
yagom.height = 123.4
yagom.weight = 123.4

// 클래스의 경우 참조타입이므로 더는 참조할 필요가 없을 때 메모리에서 해제된다. ==> 소멸
// 메모리에서 해제되기 직전 deinit 메서드가 호출 (클래스당 하나)

class Person2 {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    deinit {
        print("Person 클래스의 인스턴스가 소멸.")
    }
}

var yagom2: Person2? = Person2()
yagom2 = nil

class Person3 {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var yagom3: Person3 = Person3()
var friend3: Person3 = yagom3

print(yagom3.height, friend3.height)

friend3.height = 180

print(yagom3.height, friend3.height)

func changePersonInfo(_ info: Person3) {
    info.height = 155.3
}

changePersonInfo(yagom3)
print(yagom3.height)
//: [Next](@previous)
