import UIKit

protocol Receiveable {
  func received(data: Any, from: Sendable)
}

extension Receiveable {
  func received(data: Any, from: Sendable) {
    print("\(self) received \(data) from \(from)")
  }
}

protocol Sendable {
  var from: Sendable { get }
  var to: Receiveable? { get }
  
  func send(data: Any)
  
  static func isSendableInstance(_ instancce: Any) -> Bool
}

extension Sendable {
  var from: Sendable {
    return self
  }
  
  func send(data: Any) {
    guard let receiver: Receiveable = self.to else {
      print("Message has no receiver")
      return
    }
    
    receiver.received(data: data, from: self.from)
  }
  
  static func isSendableInstance(_ instance: Any) -> Bool {
    if let sendableInstance: Sendable = instance as? Sendable {
      return sendableInstance.to != nil
    }
    
    return false
  }
}


class Message: Sendable, Receiveable {
  var to: Receiveable?
}
