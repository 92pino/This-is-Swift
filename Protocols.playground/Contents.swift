import Cocoa

protocol SomeProtocol {
  var mustBeSettable: Int { get set }
  var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
  static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
  var fullyName: String { get }
}

struct Person: FullyNamed {
  var fullyName: String
}

let john = Person(fullyName: "John Appleseed")

protocol SomeMethodProtocol {
  static func someTypeMethod()
}

protocol RandomNumberGenetaror {
  func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenetaror {
  var lastRandom = 42.0
  let m = 139968.0
  let a = 3877.0
  let c = 29573.0
  func random() -> Double {
    lastRandom = ((a + c).truncatingRemainder(dividingBy: m))
    return lastRandom / m
  }
}
