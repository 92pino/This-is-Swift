import UIKit

// 서브스크립트
// 별도의 설정자, 접근자등의 메서드를 구현하지 않아도 인덱스를 통해 값을 설정하거나 가져올 수 있다.
// ex) someArray[index], someDictionary[key]

// 서브스크립트는 인스턴스의 이름 뒤에 대괄호로 감싼 값을 써줌으로써 인스턴스 내부의 특정 값에 접근할 수 있다.
// 서브스크립트 정의 문법
/*
subscript(index: Int) -> Int {
    get {
        // 적절한 서브스크립트 결괏값 반환
    }
    
    set(newValue) {
        // 적절한 설정자 역할 수행
    }
}
*/

// 읽기 전용 서브스크립트 정의 문법
/*
subscript(index: Int) -> Int {
 get {
    // 적절한 서브스크립트 값 반환
 }
 
 subscript(index: Int) -> Int {
    // 적절한 서브스크립트 결괏값 반환
 }
}
*/

struct Student {
    var name: String
    var number: Int
}

class School {
    var number: Int = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int) -> Student? {
        if index < self.number {
            return self.students[index]
        }
        return nil
    }
}

let highSchool: School = School()
highSchool.addStudents(names: "MiJeong", "JuHyun", "JiYoung", "SeongUk", "MoonDuk")

let aStudent: Student? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")
//: [Next](@next)
