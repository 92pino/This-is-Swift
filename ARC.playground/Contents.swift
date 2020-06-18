import UIKit

// ARC
// 객체의 참조 카운팅이 0이 될 경우, 더 이상 사용되지 않는 메모리로 인식하고 메모리에서 자동으로 해제시켜주는 메모리 관리 방법
// 컴파일 할 때 작동한다.


// 강한참조
// 인스턴스를 다른 인스턴스의 프로퍼티나 변수, 상수 등에 할당할 때 강한참조를 사용하면 참조 횟수가 1 증가
// 강한 참조를 사용하는 프로퍼티나 변수, 상수에 nil을 할당할 경우 참조 횟수가 1 감소

class Person {
  let name: String
  
  init(name: String) {
    self.name = name
    print("\(name) is being initialized")
  }
  
  deinit {
    print("\(name) is being deinitialized")
  }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "pino")
// pino is being initialized
// 참조 횟수 1 증가 : 1
reference2 = reference1
// 참조 횟수 1 증가 : 2
reference3 = reference1
// 참조 횟수 1 증가 : 3

reference1 = nil
// 참조 횟수 1 감소 : 2
reference2 = nil
// 참조 횟수 1 감소 : 1
reference3 = nil
// 참조 횟수 1 감소 : 0

// 참조횟수가 0이 되었으므로 메모리에서 소멷되기 직전에 deinit 호출
// pino is being deinitialized

func foo() {
  // 강한 참조
  let pino: Person = Person(name: "pino")
  // pino is being initialized
  // 참조 횟수 1 증가 : 1
  // 강한 참조 지역변수가 사용된 범위의 코드 실행이 종료되면 참조하던 인스턴스의 참조 횟수가 1 감소 : 0
  // pino is being deinitialized
}

var globalReference: Person?
func foo2() {
  let pino: Person = Person(name: "pino")
  // pino is being initialized
  // 참조 횟수 1 증가 : 1
  globalReference = pino
  // 참조 횟수 1 증가 : 2
  
  // 강한 참조 지역변수가 사용된 범위의 코드 실행이 종료되서 인스턴스의 참조 횟수가 1 감소해도 여전히 참조 횟수가 1이므로 deinit이 실행을 안한다.
}

// 강한참조 순환 문제
class Person2 {
  let name: String
  
  init(name: String) {
    print("\(name) is being initialized")
    self.name = name
  }

  var room: Room?
  
  deinit {
    print("\(name) is being deinitialized")
  }
}

class Room {
  let number: String
  
  init(number: String) {
    print("Room \(number) is being initialized")
    self.number = number
  }
  
  var host: Person2?
  
  deinit {
    print("Room \(number) is being deinitialized")
  }
}

var yagom: Person2? = Person2(name: "yagom")  // Person2에 대한 참조 횟수 1 증가 : 1
var room: Room? = Room(number: "505")         // Room에 대한 참조 횟수 1 증가 : 1

room?.host = yagom  //Person2에 대한 참조 횟수 1 증가 : 2
yagom?.room = room  // Room에 대한 참조 횟수 1 증가 : 2

room?.host = nil
yagom?.room = nil

yagom = nil // Person2에 대한 참조 횟수 1 감소 : 1
room = nil  // Room에 대한 참조 횟수 1 감소 : 1



// 약한 참조
// 약한 참조는 강한참조와는 달리 참조 횟수를 증가시키지 않는다.
// 또한 nil이 할당될 수 있으므로 항상 옵셔널
// 약한 참조로 강한참조 순환 문제를 해결할 수 있다.

class WeakRoom {
  let number: String
  
  init(number: String) {
    print("Jenny's Room \(number) is being initialized")
    self.number = number
  }
  
  weak var host: Person2?
  
  deinit {
    print("jenny's Room \(number) is being deinitialized")
  }
}

var jenny: Person2? = Person2(name: "jenny")
var weakRoom: WeakRoom? = WeakRoom(number: "505")

room?.host = jenny
jenny?.room = room

jenny = nil
room = nil


// 미소유 참조
// 약한참조와 동일하게 참조 횟수를 증가시키진 않지만, 항상 메모리에 인스턴스가 존재할 것이라는 전제를 기반으로 동작

class UnownedPerson {
  let name: String
  
  var card: CreditCard?
  
  init(name: String) {
    print("\(name) is being initialized")
    self.name = name
  }
  
  deinit {
    print("\(name) is being deinitialized")
  }
}

class CreditCard {
  let number: UInt
  unowned let owner: UnownedPerson  // 카드 소유자가 분명히 존재해야한다.
  
  init(number: UInt, owner: UnownedPerson) {
    print("Card #\(number) is being initialized")
    self.number = number
    self.owner = owner
  }
  
  deinit {
    print("Card #\(number) is being deinitialized")
  }
}

var jisoo: UnownedPerson? = UnownedPerson(name: "jisoo")  // UnownedPerson 인스턴스의 참조 횟수 1 증가 : 1

if let person: UnownedPerson = jisoo {
  // CreditCard 인스턴스의 참조 횟수 증가 : 1
  person.card = CreditCard(number: 1004, owner: person)
  // UnownedPerson 인스턴스의 참조 횟수 : 1
}
jisoo = nil // UnownedPerson의 참조 횟수 감소 : 0
// CreditCard 참조 횟수 감소 : 0

// jisoo is being deinitialized
// Card #1004 is being deinitiazlied
