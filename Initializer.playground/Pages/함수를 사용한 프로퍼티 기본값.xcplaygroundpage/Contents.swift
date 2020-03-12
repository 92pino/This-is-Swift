import Foundation
//: [Previous](@previous)
// 인스턴스를 초기화할 때 함수나 클로거자 호출되면서 연산 결괏값을 프로퍼티 기본값으로 제공
// 클로저나 함수의 반환 타입은 프로퍼티의 타입과 일치해야한다.

// 만약 클로저를 사용할 경우 클로저가 실행되는 시점은 초기화할 때 인스턴스의 다른 프로퍼티 값이 설정되기 전
// 클로저 내부에서 인스턴스의 다른 프로퍼티를 사용하여 연산할 수 없다. ==> self 사용 불가, 인스턴스 메서드 호출 불가

/*
class SomeClass {
    let someProperty: SomeType = {
        // 새로운 인스턴스를 생성하고 사용자정의 연산을 통한 후 변환
        // 반환되는 타입은 SomeType과 같은 타입이어야 한다.
        return SomeType
    }()
}
*/

struct Student {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var students: [Student] = {
        // 새로운 인스턴스를 생성하고 사용자정의 연산을 통한 후 반환
        // 반환되는 값의 타입은 [Student]타입이어야한다.
        var arr: [Student] = [Student]()
        
        for num in 1...15 {
            var student: Student = Student(name: nil, number: num)
            arr.append(student)
        }
        
        // 반환되는 값의 타입은 [Student]타입이어야한다.
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.students.count)
//: [Next](@next)
