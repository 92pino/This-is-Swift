import UIKit

// 프로토콜
// 특정 역할을 하기 위한 메서드, 프로퍼티, 기타 요구사항 등의 청사진
// 프로토콜은 정의를 하고 제시를 할 뿐 스스로 기능을 구현하지는 않는다.

/*
 protocol 프로토몰 이름 {
    프로토콜 정의
 }
*/

/*
 프로토콜 채택
 clss SomeClass: AProtocol, AnotherProtocol {
    // 클래스 정의
 }
*/

protocol SomeProtocol {
    // 읽기, 쓰기 모두 가능한 프로퍼티 프로토콜
    var settableProperty: String { get set }
    
    // 읽기만 가능한 프로퍼티 프로토콜
    var notNeedToBeSettableProperty: String { get }
}

protocol AnotherProtocol {
    // 읽기, 쓰기 모두 가능한 프로퍼티 프로토콜
    static var someTypeProperty: Int { get set }
    
    // 읽기만 가능한 프로퍼티 프로토콜
    static var anotherTypeProperty: Int { get }
}

protocol Sendable {
    var from: String { get }
    var to: String { get }
}

class Message: Sendable {
    var sender: String
    var from: String {
        return self.sender
    }
    var to: String
    
    init(sender: String, receiver: String) {
        self.sender = sender
        self.to = receiver
    }
}

class Mail: Sendable {
    var from: String
    var to: String
    
    init(sender: String, receiver: String) {
        self.from = sender
        self.to = receiver
    }
}
//: [Next](@next)
