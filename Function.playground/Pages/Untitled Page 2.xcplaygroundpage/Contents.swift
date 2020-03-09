//: [Previous](@previous)

import Foundation

/*:
 # Optional
 
 - 값이 있을수도 있고 없을수도 있음을 나타내는 표현
 - 변수나 상수의 값이 nil 일수도 있다는 것을 의미한다.
*/

//var myName: String? = "yagom"
//print(myName)
//
//myName = nil
//print(myName)

func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }
}


var myName: String? = "yagom"
checkOptionalValue(value: myName)

myName = nil
checkOptionalValue(value: myName)

let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers {
    switch number {
    case .some(let value) where value < 0:
        print("Negative value!! \(value)")
    case .some(let value) where value > 10:
        print("Large value!! \(value)")
    case .some(let value):
        print("Value \(value)")
    case .none:
        print("nil")
    }
}

// 옵셔널 강제 추출 (가장 간단하지만 위험한 방법) ==> 되도록 사용 X
myName = "yagom"
var yagom: String = myName!

myName = nil

print(myName)
// if 구문 등 조건문을 이용해 조금 더 안전하게 처리할 수 있다.
if myName != nil {
    print("My name is \(myName!)")
} else {
    print("My name == nil")
}

// 옵셔널 바인딩
// 옵셔널에 값이 있는지 확인할 때 사용
// 만약 값이 있다면 옵셔널에서 추출한 값을 일정 블록 안에서 사용할 수 있는 상수나 변수로 할당해서 옵셔널이 아닌 형태로 사용할수 있게 해준다.

var myName2: String? = "yagom"  // optional

if let name = myName2 {
    print("My name is \(name)")
} else {
    print("My name == nil")
}

if var name = myName2 {
    name = "wizplan"
    print("My name is \(name)")
} else {
    print("My name == nil")
}

// 여러개 옵셔널 값 추출
var myName3: String? = "yagom"
var yourName: String? = nil

if let name = myName3, let friend = yourName {
    print("We are frined")
}

yourName = "eric"

if let name = myName3, let friend = yourName {
    print("We are friend! \(name) & \(friend)")
}
//: [Next](@next)
