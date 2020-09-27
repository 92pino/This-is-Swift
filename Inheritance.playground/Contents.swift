import Cocoa

/*
  
 
 
*/

class Vehicle {
  var currentSpeed = 0.0
  var description: String {
    return "traveling at \(currentSpeed) miles per hour"
  }
  func makeNoise() {
    
  }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

class Bicycle: Vehicle {
  var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.currentSpeed)")
bicycle.description
bicycle.makeNoise()

class Tandem: Bicycle {
  var currentNumberOfPassengers = 0
}

let tandem = Tandem()
print(tandem.hasBasket)
print(tandem.currentNumberOfPassengers)
print(tandem.currentSpeed)
print(tandem.description)

// Tandem의 고유 속성인 currentNumberOfPassengers와 자신의 부모 Bicycle, Vehicle 속성 모두 사용 가능

/*
 
 Overriding
 상속받은 것을 재정의
 
 */

class Train: Vehicle {
  override func makeNoise() {
    print("Choo Choo")
  }
}

let train = Train()
train.makeNoise()
tandem.makeNoise()

// 읽기 전용 프로퍼티는 getter/setter로 변경해서 제공 가능하지만
// 읽고/쓰기가 가능한 프로퍼티는 읽기전용 프로퍼티로 선언할 수 없다.
class Car: Vehicle {
  var gear = 1
  override var description: String {
    return super.description + " in gear \(gear)"
  }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print(car.description)

// 이미 선언된 프로퍼티 옵저버도 서브클래스에서 재정의해 사용할 수 있다. (상수, 읽기전용 프로퍼티에는 옵저버를 붙일 수 없다) ==> set을 할 수 없는 프로퍼티이기 떄문
class AutomaticCar: Car {
  override var currentSpeed: Double {
    didSet {
      gear = Int(currentSpeed / 10.0) + 1
    }
  }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print(automatic.description)

// 특정 메소드, 프로퍼티, 서브스크립트가 오버라이드 되는 것을 방지하기 위해 final 키워드를 사용
