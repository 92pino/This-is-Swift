import Cocoa

//class Person {
//  let name: String
//
//  init(name: String) {
//    self.name = name
//    print("\(name) is being initialized")
//  }
//
//  deinit {
//    print("\(name) is being deinitialized")
//  }
//}
//
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "John Appleseed")
//reference2 = reference1
//reference3 = reference1
//
//reference1 = nil
//reference2 = nil
//reference3 = nil

class Person {
  let name: String
  init(name: String) {
    self.name = name
  }
  var apartment: Apartment?
  deinit {
    print("\(name) is being deinitialized")
  }
}

class Apartment {
  let unit: String
  init(unit: String) {
    self.unit = unit
  }
  var tenant: Person?
  deinit {
    print("Apartment \(unit) is being deinitialized")
  }
}

var john: Person?
var unit4A: Apartment?

// Person 참조횟수 1 증가 == 1
john = Person(name: "John Appleseed")
// Apartment 참조횟수 1 증가 == 1
unit4A = Apartment(unit: "4A")

// Apartment 참조횟수 1 증가 == 2
john!.apartment = unit4A
// Person 참조횟수 1 증가 == 2
unit4A!.tenant = john

// nil을 할당
john = nil
unit4A = nil

// nil을 할당 해도 참조 횟수가 1씩 남아있어서 인스턴스 해지는 안되고 메모리 누수가 발생한다.

// 강한 참조 순환 문제를 해결하기 위한 방법 2가지
/*

 1. weak 참조
  - 참조하고 있는 인스턴스가 먼저 메모리에서 해제될때 사용
 2. unowned 참조
  - 참조하고 있는 인스턴스가 같은 시점 혹은 더 뒤에 해제될때 사용
 
 두가지 다 참조횟수를 증가시키지 않고 인스턴스를 참조한다.
 
*/

// Weak
// 약한 참조로 선언하면 참조하고 있는 것이 먼저 메모리에서 해제되기 때문에 약한 참조로 선언된 참조 대상이 해지되면 런타임에 자동으로 참조하고 잇는 변수에 nil을 할당

class WeakPerson {
  let name: String
  init(name: String) {
    self.name = name
  }
  var apartment: WeakApartment?
  deinit {
    print("\(name) is being deinitialized")
  }
}

class WeakApartment {
  let unit: String
  init(unit: String) {
    self.unit = unit
  }
  weak var tenant: WeakPerson?
  deinit {
    print("Apartment \(unit) is being deinitialized")
  }
}

var weakJohn: WeakPerson?
var weakUnit4A: WeakApartment?

weakJohn = WeakPerson(name: "John Appleseed")
weakUnit4A = WeakApartment(unit: "4A")

weakJohn?.apartment = weakUnit4A

class Customer {
  let name: String
  var card: CreditCard?
  
  init(name: String) {
    self.name = name
  }
  
  deinit {
    print("\(name) is being deinitialized")
  }
}

class CreditCard {
  let number: UInt64
  unowned let customer: Customer
  init(number: UInt64, customer: Customer) {
    self.number = number
    self.customer = customer
  }
  deinit {
    print("Card #\(number) is being deinitialized")
  }
}

var unOwnedJohn: Customer?

unOwnedJohn = Customer(name: "John Appleseed")
unOwnedJohn?.card = CreditCard(number: 1234_5678_9012_3456, customer: unOwnedJohn!)
unOwnedJohn = nil

class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "Some default text"
heading.asHTML = {
  return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML)
