import Foundation
//: [Previous](@previous)
// 재정의 방지
// 부모클래스를 상속받는 자식클래스에서 몇몇 특성을 재정의할 수 없도록 제한하고 싶다면 특성 앞에 final 키워드를 명시하면 된다.
// 해당 특성을 자식클래스에서 재정의하려고 하면 컴파일 오류가 발생

class Person {
    final var name: String = ""
    
    final func speak() {
        print("가나다라마바사")
    }
}

final class Student: Person {
    /*
    override var name: String {
        // final 키워드로 인한 재정의 불가
        set {
            super.name = newValue
        }
        
        get {
            return "학생"
        }
    }
    */
    
    // Person의 speak는 final을 사용하므로 재정의 불가
    /*
    override func speak() {
        print("저는 학생입니다.")
    }
    */
}

// Student는 final을 사용하여 상속할 수 없다
/*
class UniversityStuent: Student {}
*/
//: [Next](@next)
