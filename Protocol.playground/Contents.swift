import UIKit

// 프로토콜
// 특정 역할을 하기 위한 메서드, 프로퍼티, 기타 요구사항 등의 청사진
// 정의하고 제시할 뿐 스스로 기능을 구현하지는 않는다.

/**
 
 protocol 프로토콜 이름 {
  프로토콜 정의
 }
 
 struct SomeStruct: AProtocol, AnotherProtocol {
  // 구조체 정의
 }
 
 class SomeClass: AProtocol, AnotherProtocol {
  // 클래스 정의
 }
 
 enum SomeEnum: AProtocol, AnotherProtocol {
  // 열거형 정의
 }
 
*/


protocol SomeProtocol {
  var settableProperty: String { get set }
  var notNeedToBeSettableProperty: String { get }
}

protocol AnotherProtocol {
  static var someTypeProperty: Int { get set }
  static var anotherTypeProperty: Int { get }
}

struct Test: SomeProtocol {
  var settableProperty: String
  
  var notNeedToBeSettableProperty: String
}


protocol Receiveable {
  func received(data: Any, from: Sendable)
}

protocol Sendable {
  var from: Sendable { get }
  var to: Receiveable? { get }
  
  func send(data: Any)
  
  static func isSendableInstance(_ instance: Any) -> Bool
}


class Message: Sendable, Receiveable {
  var from: Sendable {
    return self
  }
  
  var to: Receiveable?
  
  func send(data: Any) {
    guard let receiver: Receiveable = self.to else {
      print("Message has no receiver")
      return
    }
    
    receiver.received(data: data, from: self.from)
  }
  
  func received(data: Any, from: Sendable) {
    print("Message received \(data) from \(from)")
  }
  
  // class 메서드이므로 상속 가능
  class func isSendableInstance(_ instance: Any) -> Bool {
    if let sendableInstance: Sendable = instance as? Sendable {
      return sendableInstance != nil
    }
    
    return false
  }
}

class Mail: Sendable, Receiveable {
  var from: Sendable {
    return self
  }
  
  var to: Receiveable?
  
  func send(data: Any) {
    guard let receiver: Receiveable = self.to else {
      print("Mail has no receiver")
      return
    }
    
    receiver.received(data: data, from: self.from)
  }
  
  func received(data: Any, from: Sendable) {
    print("Mail received \(data) from \(from)")
  }
  
  // static 메서드 상속 불가
  static func isSendableInstance(_ instance: Any) -> Bool {
    if let sendableInstance: Sendable = instance as? Sendable {
      return sendableInstance.to != nil
    }
    
    return false
  }
}

let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

myPhoneMessage.send(data: "Hello")

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")

let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "Hi")

myMail.to = yourMail
myMail.send(data: "Hi")

myMail.to = myPhoneMessage
myMail.send(data: "Bye")

Message.isSendableInstance("Hello")




protocol Resttable {
  // 프로토콜이 어떤 타입이든 간에 인스턴스 내부의 값을 변겨애야 하는 메서드를 요구하려면 프로토콜 메서드 정의 앞에 mutating 키워드를 명시해야 한다.
  // class는 참조 타입이여서 mutating을 명시하지 않아도 된다.
  // 구조체나 열거형은 값 타입이여서 mutating 키워드를 붙인 가변 메서드 요구가 필요하다.
  mutating func reset()
}

class Person: Resttable {
  var name: String?
  var age: Int?
  
  func reset() {
    self.name = nil
    self.age = nil
  }
}

struct Point: Resttable {
  var x: Int = 0
  var y: Int = 0
  
  mutating func reset() {
    self.x = 0
    self.y = 0
  }
}

enum Direction: Resttable {
  case east, west, south, north, unknown
  
  mutating func reset() {
    self = Direction.unknown
  }
}

protocol Named {
  var name: String { get }
  
  init(name: String)
}

struct Pet: Named {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

class Person2: Named {
  var name: String
  
  required init(name: String) {
    self.name = name
  }
}

