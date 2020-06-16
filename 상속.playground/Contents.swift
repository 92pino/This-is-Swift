import UIKit

// 상속
// 부모클래스로부터 물려받은 메서드를 호출할 수 있고, 프로퍼티에 접근할 수 있으며 서브스크립트도 사용할 수 있다.
// 또한 부모클래스로부터 물려받은 메서드, 프로퍼티, 서브스크립트 등을 자신만의 내용으로 재정의할 수 있는데 이때, 자식클래스가 부모클래스의 요소를 재정의한다는 것을 명확히 확인해주어야한다.


class Person {
  var name: String = ""
  var age: Int = 0
  
  var introduction: String {
    return "이름 : \(name). 나이 : \(age)"
  }
  
  func speak() {
    print("가나다라마바사")
  }
}

let pino: Person = Person()
pino.name = "pino"
pino.age = 99

print(pino.name, pino.age)
pino.speak()
print(pino.introduction)

class Student: Person {
  var grade: String = "F"
  
  func study() {
    print("Study hard...")
  }
}



let jay: Student = Student()
jay.name = "jay"
jay.age = 10
jay.grade = "A"
print(jay.introduction)
jay.speak()
jay.study()

class UniversityStudyent: Student {
  var major: String = ""
}

let jenny: UniversityStudyent = UniversityStudyent()
jenny.major = "Art"
jenny.speak()
jenny.study()


// 재정의
// 자식클래스는 부모클래스로부터 물려받은 특성을 그대로 사용하지 않고 자신만의 기능으로 변경하여 사용할 수 있는데 이를 재정의라고 한다.
// 상속받은 특성들을 재정의하려면 새로운 정의 앞에 override라는 키워드를 사용해야한다.
// 조상클래스에 해당 특성이 있는지 확인한 후 재정의하는데 해당 특성이 없는데 override 키워드를 사용할 경우 컴파일 오류가 발생한다.

// 자식클래스에서 부모클래스의 특성을 재정의했을 때, 부모클래스의 특성을 자식클래스에서 사용하고 싶다면 super 프로퍼티를 사용하면 된다.

class OverridePerson {
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

class OverrideStudent: OverridePerson {
  var grade: String = "F"
  
  func study() {
    print("Study hard...")
  }
  
  override func speak() {
    print("저는 학생입니다.")
  }
}

class OverrideUniversityStudent: OverrideStudent {
  var major: String = ""
  
  class func introduceClass() {
    print(super.introduceClass())
  }
  
  override class func introduceClass() -> String {
    return "대학생의 소원은 A+입니다."
  }
  
  override func speak() {
    super.speak()
    print("대학생이죠.")
  }
}

let overridePino: OverridePerson = OverridePerson()
overridePino.speak()

let overrideJay: OverrideStudent = OverrideStudent()
overrideJay.speak()

let overrideJenny: OverrideUniversityStudent = OverrideUniversityStudent()
overrideJenny.speak()


// 프로퍼티 재정의
// 저장 프로퍼티로 재정의할수는 없으며, 프로퍼티의 접근자, 설정자, 감시자 등을 재정의하는 것을 의미한다.
// 조상클래스에서 읽기 전용 프로퍼티였어도 자식클래스에서 읽고 쓰기가 가능한 프로퍼티로 재정의해줄 수 있다.

class propertyOverridePerson {
  var name: String = ""
  var age: Int = 0
  // 읽기 전용 프로퍼티 (get)
  var koreanAge: Int {
    get {
      return self.age + 1
    }
  }
  
  var introductions: String {
    return "이름 : \(name). 나이 : \(age)"
  }
}

class propertyOverrideStudent: propertyOverridePerson {
  var grade: String = "F"
  
  override var introductions: String {
    return super.introductions + " " + "학점 : \(self.grade)"
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

let propertyPino: propertyOverridePerson = propertyOverridePerson()
propertyPino.name = "pino"
propertyPino.age = 55
// koreanAge 는 읽기전용이라 값 변경 불가
//propertyPino.koreanAge = 56

let propertyJay: propertyOverrideStudent = propertyOverrideStudent()
propertyJay.name = "jay"
propertyJay.age = 14
propertyJay.koreanAge = 15
print(propertyJay.introductions)
print(propertyJay.koreanAge)



// 재정의 방지

// 부모 클래스를 상속받는 자식클래스에서 몇몇 특성을 재정의 할 수 없도록 제한하고 싶다면 final 키워드를 명시하면 된다.

class finalPerson {
  final var name: String = ""
  
  final func speak() {
    print("가나다라마바사")
  }
}

//final class finalStudent: finalPerson {
//  override var name: String {
//    get {
//      return "학생"
//    }
//
//    set {
//      super.name = newValue
//    }
//  }
//
//  override func speak() {
//    print("저는 학생입니다.")
//  }
//}
//
// finalStudent가 final로 되어있으므로 클래스 상속 불가
//class finalUniversityStudent: finalStudent {}
