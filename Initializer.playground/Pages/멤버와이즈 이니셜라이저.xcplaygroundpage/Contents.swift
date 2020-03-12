import Foundation
//: [Previous](@previous)
// 멤버와이즈 이니셜라이저
// 모든 저장 프로퍼티의 이름과 할당할 값을 매개변수로 넣으면서 초기화하는 것
// 구조체에서만 사용 가능

struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)
let size: Size = Size(width: 50.0, height: 50.0)
//: [Next](@next)
