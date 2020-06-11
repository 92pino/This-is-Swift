import UIKit

struct CoordinatePoint {
  var x: Int = 0  // 저장 프로퍼티
  var y: Int = 0  // 저장 프로퍼티
}


//let yagomPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

class Position {
  lazy var point: CoordinatePoint = CoordinatePoint()
  let name: String
  
  // 프로퍼티 기본값을 지정해주지 않으면 init으로 따로 정의해줘야한다.
  init(name: String) {
    self.name = name
  }
}

let yagomPosition: Position = Position(name: "yagom")
print(yagomPosition)
print(yagomPosition.point.x, yagomPosition.point.y)


struct CoordinatePoint2 {
  var x: Int = 0   // 저장 프로퍼티
  var y: Int = 0  // 저장 프로퍼티
}

// 프로퍼티의 초깃값을 할당했다면 굳이 전달인자로 초깃값을 넘길 필요가 없다.
let yagomPoint2: CoordinatePoint2 = CoordinatePoint2()

// 전달인자에 초깃값을 넘길 수도 있다.
let wizplanPoint: CoordinatePoint2 = CoordinatePoint2(x: 10, y: 5)

print(yagomPoint2.x, yagomPoint2.y)
print(wizplanPoint.x, wizplanPoint.y)



// 지연 저장 프로퍼티
// 호출이 있어야 값이 초기화된다.
// 필요할 떄 값을 할당하는 지연프로퍼티이므로 let 보다는 var가 더 잘어울려


// 연산 프로퍼티
// 특정 상태에 따른 값을 연산하는 프로퍼티

struct CoordinatePoint3 {
  var x: Int
  var y: Int
  
  var oppositePoint: CoordinatePoint3 {
    get {
      return CoordinatePoint3(x: -x, y: -y)
    }
  }
}


var yagomPosition3: CoordinatePoint3 = CoordinatePoint3(x: 10, y: 20)
print(yagomPosition3)
print(yagomPosition3.oppositePoint)

// get만 사용할 경우 읽기 전용으로 값 변경을 할 수 없다.

// 프로퍼티 감시자
// 값이 변경됨에 따라 적절한 액션을 취할 수 있다.
// 프로퍼티 감시자는 프로퍼티의 값이 새로 할당될 때마다 호출 (변경되는 값이 현재의 값과 같더라도 호출)

class Test {
  var credit: Int = 0 {
    willSet(new) {
      // 변경될 값
      print("잔액이 \(credit)원에서 \(new)원으로 변경될 예정입니다.")
    }
    
    didSet(old) {
      // 변경되기 전의 값
      print("잔액이 \(old)에서 \(credit)으로 변경되었습니다")
    }
  }
}

let myAccount: Test = Test()
myAccount.credit = 1000

class Account {
  var credit: Int = 0 {
    willSet(new) {
      // 변경될 값
      print("잔액이 \(credit)원에서 \(new)원으로 변경될 예정입니다.")
    }
    
    didSet(old) {
      // 변경되기 전의 값
      print("잔액이 \(old)에서 \(credit)으로 변경되었습니다")
    }
  }
  
  var dollarValue: Double {
    get {
      return Double(credit) / 1000.0
    }
    
    set {
      credit = Int(newValue * 1000)
      print("잔액을 \(newValue)달러로 변경 중입니다.")
    }
  }
}

class ForeignAccount: Account {
  override var dollarValue: Double {
    willSet {
      print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
    }
    
    didSet {
      print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
    }
  }
}

let myAccount2: ForeignAccount = ForeignAccount()
myAccount2.credit = 1000

myAccount2.dollarValue = 2

// 타입 프로퍼티
// 모든 타입이 사용할 수 있는 상수 프로퍼티 또는 글로벌 변수 프로퍼티와 같이 특정 타입의 모든 인스턴스에 공통적인 값을 정의하는데 사용

// 저장 타입프로퍼티
// 변수 또는 상수로 선언 가능
// 반드시 초깃값을 설정해야 하며 지연 연산이 가능하다.
// ==> 초기화시 타입 자체에는 저장 타입 프로퍼티에 값을 할당할 initializer가 없기 때문
// ==> 지연 저장 프로퍼티와는 다르게 다중 스레드 환경이라고 하더라도 한 번만 초기화된다는 보장을 받아서 lazy 키워드를 사용할 필요가 없다.

// 연산 타입 프로퍼티
// 항상 변수 프로퍼티로 선언

class AClass {
  // 저장 타입 프로퍼티
  static var typeProperty: Int = 0
  
  // 저장 인스턴스 프로퍼티
  var instanceProperty: Int = 0 {
    didSet {
      AClass.typeProperty = instanceProperty + 100
    }
  }
  
  // 연산 타입 프로퍼티
  static var typeComputedProperty: Int {
    get {
      return typeProperty
    }
    
    set {
      typeProperty = newValue
    }
  }
}

AClass.typeProperty
AClass.typeProperty = 123
AClass.typeProperty

let classInstance: AClass = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty)
print(AClass.typeComputedProperty)

class SomeClass {
  static var storedTypeProperty = "Some value"
  
  static var computedTypeProperty: Int {
    return 27
  }
  
  class var overrideableComputedTypeProperty: Int {
    return 107
  }
}

class typePropertyAccount {
  static let dollarExchangeRate: Double = 1000.0  // 타입 상수 프로퍼티
  
  var credit: Int = 0
  var dollarValue: Double {
    get {
      return Double(credit) / typePropertyAccount.dollarExchangeRate
    }
    
    set(new) {
      credit = Int(new * typePropertyAccount.dollarExchangeRate)
      print("잔액을 \(new)달러로 변경 중입니다.")
    }
  }
}

let result: typePropertyAccount = typePropertyAccount()

result.dollarValue = 2
print(result.credit)
