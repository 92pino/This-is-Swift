import UIKit

// 타입캐스팅
// 인스턴스의 타입을 확인하거나 자신을 다른 타입의 인스턴스인양 행세할 수 있는 방법
// is || as 연산자로 값의 타입을 확인하거나 다른 타입으로 전환할 수 있다.

class Coffee {
    let name: String
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
    var iced: Bool
    
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

print(coffee is Coffee)
print(coffee is Americano)
print(coffee is Latte)

print(myCoffee is Coffee)
print(yourCoffee is Coffee)

print(myCoffee is Latte)
print(yourCoffee is Latte)
//: [Next](@next)
