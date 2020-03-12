import UIKit

// 이니셜라이저
// 인스턴스의 첫 사용을 위해 초기화하는 역할

// 매개변수가 없는 기본 이니셜라이저
class SomeClass {
    init() {
        // 초기화할 떄 필요한 코드
    }
}

struct SomeStruct {
    init() {
        // 초기화할 때 필요한 코드
    }
}

enum SomeEnum {
    case SomeCase
    
    init() {
        // 열거형은 초기화할 때 반드시 case중 하나가 되어야 한다.
        self = .SomeCase
        // 초기화할 때 필요한 코드
    }
}

// 초기값 설정
struct Area {
    var squareMeter: Double
    
    init() {
        squareMeter = 0.0   // squareMeter의 초기값 할당
    }
}

let room: Area = Area()
print(room.squareMeter)

struct Area2 {
    var squareMeter: Double = 0.0   // 프로퍼티 기본값 할당
}

let room2: Area2 = Area2()
print(room2.squareMeter)
//: [Next](@next)
