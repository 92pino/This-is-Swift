import UIKit

// 클래스, 구조체, 열거형의 기본적인 형태의 이니셜라이저
class SomeClass {
  init() {
    // 초기화할 때 필요한 코드
  }
}

struct SomeStruct {
  init() {
    // 초기화할 때 필요한 코드
  }
}

enum SomeEnum {
  case someCase
  
  init() {
    // 열거형을 초기화할 때 반드시 case 중 하나가 되어야 한다.
    self = .someCase
    // 초기화할 때 필요한 코드
  }
}

struct Area {
  var squareMeter: Double
  var defaultValue: Double = 0.0
  
  init() {
    squareMeter = 0.0 // squareMeter 초기값 할당
  }
}

let room: Area = Area()
print(room)

struct Area2 {
  var squareMeter: Double
  
  init(fromPy py: Double) {
    squareMeter = py * 3.3058
  }
  
  init(fromSquareMeter squareMeter: Double) {
    self.squareMeter = squareMeter
  }
  
  init(value: Double) {
    squareMeter = value
  }
  
  init(_ value: Double) {
    squareMeter = value
  }
}

let roomOne: Area2 = Area2(fromPy: 15.0)
print(roomOne.squareMeter)

let roomTwo: Area2 = Area2(fromSquareMeter: 33.06)
print(roomTwo.squareMeter)

let roomThree: Area2 = Area2(value: 30.0)
print(roomThree.squareMeter)

let roomFour: Area2 = Area2(55.0)
print(roomFour.squareMeter)


// 옵셔널 프로퍼티

class Person {
  var name: String
  var age: Int?
  
  init(name: String) {
    self.name = name
  }
}

let yagom: Person = Person(name: "yagom")
// 옵셔널 프로퍼티에 값을 할당하지 않을 경우 nil로 반환
print(yagom.name, yagom.age)

yagom.age = 99
print(yagom.age!)


// 상수 프로퍼티
class Person2 {
  let name: String
  var age: Int?
  
  init(name: String) {
    self.name = name
  }
}

let pino: Person2 = Person2(name: "pino")
print(pino.name)

// 상수로 선언된 프로퍼티를 변경할 경우 에러 발생
//pino.name = "Eric"


// 멤버 이니셜라이저
// 구조체에서만 사용 가능하며, 기본값을 지정해주지 않았을 때 프로퍼티 이름으로 매개변수를 갖는 이니셜라이저
// 클래스에서는 지원을 하지 않는다.

struct Point {
  var x: Double = 0.0
  var y: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)

struct Size {
  var width: Double = 0.0
  var height: Double = 0.0
}

let size: Size = Size(width: 50.0, height: 50.0)


// 초기화 위임
// 값타입인 구조체와 열거형은 코드의 중복을 피하기 위해 다른 이니셜라이저에 일부 초기화를 위임한다.

enum Student {
  case elementary, middle, high
  case none

  init() {
    self = .none
  }

  init(koreanAge: Int) {
    switch koreanAge {
    case 8...13:
      self = .elementary
    case 14...16:
      self = .middle
    case 17...19:
      self = .high
    default:
      self = .none
    }
  }
  
  init(bornAt: Int, currentYear: Int) {
    self.init(koreanAge: currentYear - bornAt + 1)
  }
}

var younger: Student = Student(koreanAge: 16)
print(younger)

younger = Student(bornAt: 1998, currentYear: 2020)
print(younger)


// 실패 가능한 이니셜라이저
// 실패했을 때 nil을 반환해주므로 옵셔널로 지정
// init 대신 init?을 사용해야한다.

class FailInit {
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

let pino2: FailInit? = FailInit(name: "pino", age: 99)

func test() {
  guard let person2 = pino2 else { return }
  print(person2.name)
  print(person2.age ?? "")
}
test()

if let person: FailInit = pino2 {
  print(person.name)
} else {
  print("Person wasn't initialized")
}

let chope: FailInit? = FailInit(name: "chope", age: -10)

if let person: FailInit = chope {
  print(person.name)
} else {
  print("Person wasn't initialized")
}

// 실패 가능한 이니셜라이저 (열거형)

enum Student2: String {
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

var younger2: Student2? = Student2(koreanAge: 20)
print(younger2)

younger2 = Student2(bornAt: 2020, currentYear: 2016)
print(younger2)

younger2 = Student2(rawValue: "대학생")
print(younger2)

younger2 = Student2(rawValue: "고등학생")
print(younger2 ?? "")


// 함수를 사용한 프로퍼티 기본값 설정

//class SomeClass2 {
//  let someProperty: SomeType = {
//    return someValue
//  }()
//}

struct Student3 {
  var name: String?
  var number: Int?
}

class SchoolClass {
  var students: [Student3] = {
    var arr: [Student3] = [Student3]()
    
    for num in 1...15 {
      var student: Student3 = Student3(name: nil, number: num)
      arr.append(student)
    }
    
    return arr
  }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.students.count)

// 인스턴스 소멸
// 메모리에서 해제되기 직전 클래스 인스턴스와 관련하여 원하는 정리 작업을 구현
// 디이니셜라이즈는 클래스의 인스턴스가 메모리에서 소멸되기 바로 직전에 호출
// deinit 키워드를 사용 ( 클래스의 인스턴스에만 구현할 수 있다.)

class SomeClassTest {
  deinit {
    print("Instance will be deallocated immediately")
  }
}

var instance: SomeClassTest? = SomeClassTest()
instance = nil
