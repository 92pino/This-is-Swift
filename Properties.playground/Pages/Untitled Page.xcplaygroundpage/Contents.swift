import UIKit

/*:
 - 저장 프로퍼티
    - 인스턴스의 변수 또는 상수
    - 구조체 클래스에서만 사용
 - 연산 프로퍼티
    - 값을 저장한 것이 아니라 특정 연산을 실행한 결과값
    - 클래스, 구조체, 열거형에 사용
 - 타입 프로퍼티
    - 특정 타입에 사용되는 프로퍼티
 - 프로퍼티 감시자
    - 프로퍼티의 값이 변하는 것을 감시
    - 프로퍼티의 값이 변할 때 값의 변화에 따른 특정 액션을 실행
    -저장 프로퍼티에 적용할 수 있으며 부모클래스로부터 상속 받을 수 있다.
*/
// 저장 프로퍼티
// 저장 프로퍼티를 정의할 때 프로퍼티 기본값을 지정할 수 있으며, 초기화할 때 초깃값을 지정할 수 있다.

// 저장 프로퍼티의 선언
struct CoordinatePoint {
    var x: Int = 0  // 저장 프로퍼티
    var y: Int = 0  // 저장 프로퍼티
}

// 인스턴스 생성
let yagomPoint: CoordinatePoint = CoordinatePoint()
// 초기값이 있어도 초기값을 할당할 수 있다.
let wizplanPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

print(yagomPoint, wizplanPoint)

// 저장 프로퍼티 선언
// 클래스에서 저장 프로퍼티가 옵셔널이 아니라면 이니셜라이저를 따로 정의해주어야 한다.
// 만약 초기값이 있다면 이니셜라이저를 따로 정의할 필요가 없다.
class Position {
    var point: CoordinatePoint?
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// 이름은 필수지만 위치는 모를수도 있다
let yagomPosition: Position = Position(name: "yagom")
print(yagomPosition.point, yagomPosition.name)
yagomPosition.point = CoordinatePoint(x: 10, y: 5)

print(yagomPosition.point?.x, yagomPosition.name)


// 지연 저장 프로퍼티
// 호출이 있어야 값을 초기화하며 이때 lazy 키워드를 사용
// 상수는 인스턴스가 완전히 생성되기 전에 초기화해야 하므로 필요할때 값을 할당하는 지연 저장 프로퍼티와는 맞지 않다. (변수만 사용)

struct CoordinatePoint2 {
    var x: Int
    var y: Int
}

class Position2 {
    lazy var point: CoordinatePoint2 = CoordinatePoint2(x: 10, y: 5)
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let yagomPosition2: Position2 = Position2(name: "yagom")
print(yagomPosition2.point)

//: [Next](@previous)
