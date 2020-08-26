//: [Previous](@previous)

import Foundation

//struct CoordinatePoint {
//  var x: Int
//  var y: Int
//}
//
//let point: CoordinatePoint = CoordinatePoint(x: 10, y: 5)
//
//class Position {
//  var point = CoordinatePoint // 저장 프로퍼티 (변수) - 위치는 변경될 수 있음을 의미
//  let name: String            // 저장 프로퍼티 (상수)
//
//  init(name: String, currentPoint: CoordinatePoint) {
//    self.name = name
//    self.point = currentPoint
//  }
//}
//
//let position: Position = Position(name: "pino", currentPoint: point)

//struct CoordinatePoint {
//  var x: Int = 0  // 저장 프로퍼티
//  var y: Int = 0  // 저장 프로퍼티
//}
//
//// 프로퍼티의 초깃값을 할당했다면 굳이 전달인자로 초깃값을 넘길 필요가 없다.
//let point: CoordinatePoint = CoordinatePoint()
//
//// 기존에 초깃값을 할당할 수 있는 이니셜라이저도 사용 가능
//let sizplanPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)
//
//print(point.x, point.y)
//
//print(sizplanPoint.x, sizplanPoint.y)
//
//class Position {
//  var point: CoordinatePoint = CoordinatePoint()  // 저장 프로퍼티
//  var name: String = "Unknown"                    // 저장 프로퍼티
//}
//
//// 초깃값을 지정해줬다면 이니셜라이저를 사용하지 않아도 된다.
//let position: Position = Position()
//
//position.point = point
//position.name = "pino"

struct CoordinatePoint {
  var x: Int
  var y: Int
}

class Position {
  var point: CoordinatePoint?
  let name: String
  
  init (name: String) {
    self.name = name
  }
}

let position: Position = Position(name: "pino")

position.point = CoordinatePoint(x: 20, y: 10)

/*:
 지연 저장 프로퍼티
 
 - 호출이 있어야 값을 초기화한다.
 - lazy 키워드 사용
 - var 키워드를 사용하여 변수 정의
 */

struct LazyCoordinatePoint {
  var x: Int = 0
  var y: Int = 0
}

class LazyPosition {
  lazy var point: LazyCoordinatePoint = LazyCoordinatePoint()
  let name: String
  
  init(name: String) {
    self.name = name
  }
}

let lazyPosition: LazyPosition = LazyPosition(name: "pino")

// point 프로퍼티로 처음 접근 할 때 point 프로퍼티의 CoordinatePoint가 생성
print(LazyPosition.point)

//: [Next](@next)
