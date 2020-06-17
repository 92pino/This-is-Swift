import UIKit

// 타입캐스팅
// 인스턴스의 타입을 확인하거나 자신을 다른 타입의 인스턴스인양 행세할 수 있는 방법으로 사용할수 있다.

class Coffee {
  let name: StaticString
  let shot: Int
  
  var description: String {
    return "\(shot) shot(s) \(name)"
  }
  
  init(shot: Int) {
    self.shot = shot
    self.name = "coffee"
  }
}

class Latte: Coffee {
  var flavor: String
  
  override var description: String {
    return "\(shot) shot(s) \(flavor) latte"
  }
  
  init(flavor: String, shot: Int) {
    self.flavor = flavor
    super.init(shot: shot)
  }
}

class Americano: Coffee {
  let iced: Bool
  
  override var description: String {
    return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
  }
  
  init(shot: Int, iced: Bool) {
    self.iced = iced
    super.init(shot: shot)
  }
}

let coffee: Coffee = Coffee(shot: 1)
print(coffee.description)

let myCoffee: Americano = Americano(shot: 2, iced: false)
print(myCoffee.description)

let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
print(yourCoffee.description)


// is 연산자
// 인스턴스가 어떤 클래스의 인스턴스인지 확인할 수 있다.
// 자식클래스의 인스턴스라면 true
// 아니라면 False 반환
print(coffee is Coffee)
print(coffee is Americano)

print(myCoffee is Coffee)
print(yourCoffee is Coffee)



// 다운캐스팅
// 자식클래스보다 더 상위에 있는 부모클래스의 타입을 자식클래스의 타입으로 캐스팅한다는 의미
// 실패할 가능성이 있을 경우 as?를 사용하여 실패했을 경우 nil을 반환하고 성공했을 경우 옵셔널타입으로 인스턴스를 반환


let actingConstant: Coffee = Latte(flavor: "vanilla", shot: 2)
print(actingConstant.description)


if let actingOne: Americano = coffee as? Americano {
  print("This is Americano")
} else {
  print(coffee.description)
}

// 항상 성공하는 다운 캐스팅은 as로 표현
if let actingTwo: Coffee = myCoffee as Coffee {
  print("This is Just Coffee")
}

// Any : 함수 타입을 포함한 모든 타입
// AnyObject : 클래스 타입만
