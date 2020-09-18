import Cocoa

print("\n---------- [ Instance Methods ] ----------\n")
// 인스턴스 메소드
// 특정 클래스, 구조체, 열거형의 인스턴스에 속한 메소드
// 이 메소드를 통해 인스턴스 내의 값을 제어 또는 변경

class Counter {
  var count = 0
  
  func increment() {
    count += 1
  }
  
  func increment(by amount: Int) {
    count += amount
  }
  
  func reset() {
    count = 0
  }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

struct Point {
  var x = 0.0, y = 0.0
  
  func isToTheRightOf(x: Double) -> Bool {
    // self 키워드를 사용하여 프로퍼티 x와 인자 x를 구분
    print(self.x, x)
    return self.x > x
  }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
  print("This point is to the right of the line where x == 1.0")
}

// 인스턴스 메소드 내에서 값 타입 변경
// 구조체, 열거형은 값 타입인데 값 타입 형의 메소드에서 프로퍼티를 변경하고 싶을 경우 mutating을 붙여 해당 키워드가 붙은 메소드는 메소드의 계산이 끝난 후 원본 구조체에 그 결과를 덮어써서 값을 변경
struct Point2 {
  var x = 0.0, y = 0.0
  mutating func moveBy(x deltaX: Double, y deltaY: Double) {
    x += deltaX
    y += deltaY
  }
}

var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveBy(x: 2.0, y: 3.0)
print(somePoint2.x, somePoint2.y)

// 타입 메서드
// 타입 프로퍼티와 동일하게 특정 타입 자체에서 호출해 사용하는것으로
// func 앞에 static, class 키워드를 추가한다. (class는 오버라이드 가능)

struct LevelTracker {
  static var highestUnlockedLevel = 1
  var currentLevel = 1
  static func unlock(_ level: Int) {
    if level > highestUnlockedLevel {
      highestUnlockedLevel = level
    }
  }
  
  static func isUnlocked(_ level: Int) -> Bool {
    return level <= highestUnlockedLevel
  }
  
  // 리턴 값이 있는 메소드에서 리턴 값을 사용하지 않으면 나오는 컴파일 경고를 발생하지 않게 해주는 역할
  @discardableResult
  mutating func advance(to level: Int) -> Bool {
    if LevelTracker.isUnlocked(level) {
      currentLevel = level
      return true
    } else {
      return false
    }
  }
}
