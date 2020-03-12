import Foundation
//: [Previous](@previous)
// 실패 가능한 이니셜라이저
// 이니셜라이저를 정의할 때 이런 실패 가능성을 염두에 두기도 하는데, 이렇게 실패 가능성을 내포한 이니셜 라이저를 '실패 가능한 이니셜라이저'라고 한다.
// ex) 이니셜라이저의 전달인자로 잘못된 값이나 적절치 못한 값이 전달되었을 때
class Person {
    let name: String
    var age: Int?
    
    init?(name: String) {
        
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

let yagom: Person? = Person(name: "yagom", age: 99)

if let person: Person = yagom {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

let chope: Person? = Person(name: "chope", age: -19)

if let person: Person = chope {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

let eric: Person? = Person(name: "", age: 30)

if let person: Person = eric {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

// 실패 가능한 이니셜라이저 (열거형)
enum Student: String {
    case elementary = "초등학생", middle = "중학생", high = "고등학생"
    
    init?(koreanAge: Int) {
        switch koreanAge {
            case 8...13:
                self = .elementary
            case 14...16:
                self = .middle
            case 17...19:
                self = .high
            default:
                return nil
        }
    }
    
    init?(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger: Student? = Student(koreanAge: 20)
print(younger)

younger = Student(bornAt: 2020, currentYear: 20)
print(younger)

younger = Student(rawValue: "대학생")
print(younger)

younger = Student(rawValue: "고등학생")
print(younger!)
//: [Next](@next)
