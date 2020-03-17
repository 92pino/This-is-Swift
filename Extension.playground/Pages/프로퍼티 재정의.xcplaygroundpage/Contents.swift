import Foundation
//: [Previous](@previous)
// 프로퍼티 재정의
// 프로퍼티를 재정의 할 때는 저장 프로퍼티가 아닌 접근자, 설정자, 프로퍼티 감시자 등을 재정의 하는 것을 의미

class Person {
    var name: String = ""
    var age: Int = 0
    var koreanAge: Int {
        return self.age + 1
    }
    
    var introduction: String {
        return "이름 : \(name). 나이 \(age)"
    }
}

class Student: Person {
    var grade: String = "F"
    
    override var introduction: String {
        return super.introduction + " " + "학점 :\(self.grade)"
    }
    
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        
        set {
            self.age = newValue - 1
        }
    }
}

let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 55
print(yagom.introduction)
print(yagom.koreanAge)

let jenny: Student = Student()
jenny.name = "Jenny"
jenny.age = 14
jenny.koreanAge = 15
print(jenny.introduction)
print(jenny.koreanAge)
//: [Next](@next)
