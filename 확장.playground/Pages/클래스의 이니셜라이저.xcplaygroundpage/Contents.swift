import Foundation
//: [Previous](@previous)
// 지정 이니셜라이저
// 필요에 따라 부모클래스의 이니셜라이저를 호출할 수 있으며, 이니셜라이저가 정의된 클래스의 모든 프로퍼티를 초기화해야 하는 임무를 갖고있다.

/*
 init(매개변수들) {
    초기화 구문
 }
*/


// 편의 이니셜라이저
// 초기화를 좀 더 쉽게 도와주는 역할로 지정 이니셜라이저를 자신 내부에서 호출
/*
 convenience init(매개변수들) {
    초기화 구문
 }
*/

class Person {
    var name: String
    var age: init
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Student: Person {
    var major: String
    
    init(name: String, age: Int, major: String) {
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 7, major: "")
    }
}
//: [Next](@next)
