import Foundation
//: [Previous](@previous)
// 요구 이니셜라이저
// required 수석어를 클래스의 이니셜라이저 앞에 명시해주면 상속받은 자식클래스에서 반드시 해당 이니셜라이저를 구현해줘야한다.

class Person {
    var name: String
    
    required init() {
        self.name = "Unknown"
    }
}

class Student: Person {
    var major: String = "Unknown"
    
    init(major: String) {
        self.major = major
        super.init()
    }
    
    required init() {
        self.major = "Unknown"
        super.init()
    }
}

class UniversityStudent: Student {
    var grade: String
    
    init(grade: String) {
        self.grade = grade
        super.init()
    }
    
    required init() {
        self.grade = "F"
        super.init()
    }
}

let miJeong: Student = Student()
print(miJeong.major)

let yagom: Student = Student(major: "Swift")
print(yagom.major)

let juHyun: UniversityStudent = UniversityStudent(grade: "A+")
print(juHyun.grade)
//: [Next](@next)
