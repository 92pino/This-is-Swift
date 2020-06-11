import UIKit

// 메서드
// 특정 타입에 관련된 함수
// 클래스, 구조체, 열거형 등에 들어가있는 함수라고 생각하면 될듯

class LevelClass {
  static let defaultPlusOne: Int = 1
  static let resetLevelNum: Int = 0
  
  var level: Int = LevelClass.resetLevelNum {
    didSet {
      print("Level \(level)")
    }
  }
  
  func levelUp() {
    print("Level Up")
    level += LevelClass.defaultPlusOne
  }
  
  func levelDown() {
    print("Level Down")
    level -= LevelClass.defaultPlusOne
    if level < LevelClass.resetLevelNum {
      reset()
    }
  }
  
  func jumpLevel(to: Int) {
    print("Jump to \(to)")
    level = to
  }
  
  func reset() {
    print("Reset!")
    level = LevelClass.resetLevelNum
  }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.levelUp()

levelClassInstance.levelDown()
levelClassInstance.jumpLevel(to: 10)
levelClassInstance.reset()

struct LevelStruct {
  static let defaultPlusOne: Int = 1
  static let resetLevelNum: Int = 0
  
  var level: Int = LevelClass.resetLevelNum {
    didSet {
      print("Level \(level)")
    }
  }
  
  // 구조체, 열거형에서는 값 타입이므로 메서드 앞에 mutating 키워드를 붙여 해당 메서드가 인스턴스 내부의 값을 변경한다는 것을 명시해야한다.
  mutating func levelUp() {
    print("Level Up")
    level += LevelClass.defaultPlusOne
  }
  
  mutating func levelDown() {
    print("Level Down")
    level -= LevelClass.defaultPlusOne
    if level < LevelClass.resetLevelNum {
      reset()
    }
  }
  
  mutating func jumpLevel(to: Int) {
    print("Jump to \(to)")
    level = to
  }
  
  mutating func reset() {
    print("Reset!")
    level = LevelClass.resetLevelNum
  }
}


// 타입 메서드
// 타입 프로퍼티와 동일한 역할을 하는 메서드
// 메서드의 func 키워드 앞에 "static"과 "class"키워드가 붙어서 타입 메서드를 나타낸다
// static의 경우 구조체, 열거형, 클래스 다 사용 가능하며 클래스에서 사용할 경우 상속 후 메서드 재정의가 불가능하다.
// class를 사용하여 메서드 재정의가 가능하게 바꿀수 있다.

class CClass {
  static func staticTypeMethod() {
    print("CClass staticTypeMethod")
  }
  
  class func classTypeMethod() {
    print("CClass classTypeMethod")
  }
}

class DClass: CClass {
  /*
   // 타입 메서드를 static으로 선언해서 상속 후 메서드 재정의 불가능
    override static func staticTypeMethod() {
      
    }
  */
  
  override class func classTypeMethod() {
    
  }
}

// 시스템 음량은 한 기기에서 유일한 값이어야한다.
struct SystemVolume {
  // 타입 프로퍼티를 사용하여 유일한 값으로 만들기
  static var volume: Int = 5
  
  // 타입 프로퍼티를 제어하기 위해 타입 메서드를 사용
  static func mute() {
    self.volume = 0
    // SystemVolume.volume = 0과 동일한 표현
  }
}

class Navigation {
  // 내비게이션 음량은 조절 가능
  var volume: Int = 5
  
  func guideWay() {
    SystemVolume.mute()
  }
  
  func finishGuideWay() {
    SystemVolume.volume = self.volume
  }
}

SystemVolume.volume = 10
print(SystemVolume.volume)
let myNavi: Navigation = Navigation()

myNavi.guideWay()
print(SystemVolume.volume)

myNavi.finishGuideWay()
print(SystemVolume.volume)
