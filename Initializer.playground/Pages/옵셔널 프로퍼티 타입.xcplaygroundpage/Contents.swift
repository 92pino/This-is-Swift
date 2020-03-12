import Foundation
//: [Previous](@previous)
class Person {
    var name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")
print(yagom.name, yagom.age)

yagom.age = 99
yagom.name = "Eric"
print(yagom.name, yagom.age)

// 상수 프로퍼티
class Person2 {
    // 이름의 경우 수정되지 않아야되므로 상수로 선언
    let name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let yagom2: Person2 = Person2(name: "yagom")
print(yagom2.name)
// 상수로 선언해서 이름 수정이 불가능
//yagom2.name = "Eric"  // 에러 출력
//: [Next](@next)
