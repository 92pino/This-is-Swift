//: [Previous](@next)
// 프로퍼티 감시자
// 프로퍼티의 값이 변경됨에 따라 적절한 액션을 취할 수 있다.
// 프로퍼티의 값이 새로 할당될 때마다 호출 (변경되는 값이 현재와 같아도 호출)
// willSet : 변경되기 직전에 호출되는 메서드 (전달되는 전달인자 : 프로퍼티가 변경될 값)    newValue
// didSet : 변경된 직후 호출되는 메서드 (전달되는 전달인자 : 프로퍼티가 변경되 전의 값)    oldValue

import Foundation

class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경 될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)에서 \(credit)원으로 변경되었습니다")
        }
    }
    
    var dollarValue: Double {
        get {
            return Double(credit)
        }
        
        set {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)에서 \(credit)달러로 변경중입니다.")
        }
    }
}

class ForeignAccount: Account {
    override var dollarValue: Double {
        willSet {
            print(newValue)
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        
        didSet {
            print(oldValue)
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
        }
    }
}

let myAccount: ForeignAccount = ForeignAccount()

myAccount.credit = 1000

myAccount.dollarValue = 2

var wonInPocket: Int = 2000 {
    willSet {
        print("주머니의 돈이 \(wonInPocket)원에서 \(newValue)원으로 변경될 예정입니다.")
    }
    
    didSet {
        print("주머니의 돈이 \(oldValue)원에서 \(wonInPocket)원으로 변경되었습니다.")
    }
}

var dollarInPocket: Double {
    get {
        return Double(wonInPocket)
    }
    
    set {
        wonInPocket = Int(newValue * 1000.0)
        print("주머니의 달러를 \(newValue)달러로 변경 중입니다.")
    }
}

dollarInPocket = 3.5

// 타입 프로퍼티
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

AClass.typeProperty = 123
print(AClass())

let classInstance: AClass = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty)
print(AClass.typeComputedProperty)
//: [Next](@previous)
