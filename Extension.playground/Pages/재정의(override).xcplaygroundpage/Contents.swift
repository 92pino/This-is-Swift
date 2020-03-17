import Foundation
//: [Previous](@previous)
// 재정의
// 자식클래스는 부모클래스로부터 물려받은 특성(인스턴스 메서드, 타입 메서드, 인스턴스 프로퍼티, 타입 프로퍼티, 서브스크립트 등)을 그대로 사용하지 않고 자신만의 기능으로 변경하여 사용하는 것

// 새로운 정의 앞에 override 키워드 사용
// 만약 재정의할 특성이 없는데 Override를 사용할 경우 컴파일 오류 발생

// 자식 클래스에서 부모 클래스의 특성을 재정의했을 때, 부모클래스의 특성을 자식 클래스에서 사용하고 싶을 겨우 super 프로퍼티를 사용

class Person {
    var name: String = ""
    var age: Int = 0
    
    var introduction: String {
        return "이름 : \(name). 나이 : \(age)"
    }
    
    func speak() {
        print("가나다라마바사")
    }
    
    class func introduceClass() -> String {
        return "인류의 소원은 평화입니다."
    }
}

class Student: Person {
    var grade: String = "F"
    
    func study() {
        print("Study hard...")
    }
    
    override func speak() {
        print("저는 학생입니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    
    class func introduction() {
        print(super.introduceClass())
    }
    
    override class func introduceClass() -> String {
        return "대학생의 소원은 A+입니다."
    }
    
    override func speak() {
        super.speak()
//        print("대학생이죠.")
    }
}

let yagom: Person = Person()
yagom.speak()

let jay: Student = Student()
jay.speak()

let jenny: UniversityStudent = UniversityStudent()
jenny.speak()
//: [Next](@next)
