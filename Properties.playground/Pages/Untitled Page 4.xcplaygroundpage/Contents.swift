//: [Previous](@next)

// 키 경로
// 값을 바로 꺼내오는 것이 아니라 어떤 프로퍼티의 위치만 참조하도록 할수 있게 하는 방법 ( 키 경로를 활용하는 방법 )
// 키 경로는 역슬래시(\), 타입, 마침표(.)로 구성된다.

// 타입 이름.경로.경로.경로....

import Foundation

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Stuff {
    var name: String
    var owner: Person
}

print(type(of: \Person.name))
print(type(of: \Stuff.name))

let keyPath = \Stuff.owner
let nameKeyPath = keyPath.appending(path: \.name)
//: [Next](@previous)
