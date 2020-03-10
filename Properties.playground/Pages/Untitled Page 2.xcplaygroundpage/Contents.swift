//: [Previous](@next)

import Foundation

// 연산 프로퍼티
// 실제 값을 저장하는 프로퍼티가 아니라, 특정 상태에 따른 값을 연산하는 프로퍼티

struct CoordinatePoint {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
    
    // 대칭 좌표
    var oppositePoint: CoordinatePoint {    // 연산 프로퍼티
        // 접근자
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        
        // set 연산자는 필수값이 아니라 get만 사용해도 무관
        set {
            print(x, newValue)
            x = -newValue.x
            y = -newValue.y
            print(x, y)
        }
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)

print(yagomPosition)
print(yagomPosition.oppositePoint)
yagomPosition.oppositePoint = CoordinatePoint(x: 15, y: 10)
print(yagomPosition)
//: [Next](@previous)
