import Cocoa


// 저장 프로퍼티
// 단순히 값을 저장하고 있는 프로퍼티
struct FixedLengthRange {
  var firstValue: Int
  let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
print(rangeOfThreeItems.firstValue)

// 변수로 선언했을 경우에만 해당 인스턴스의 프로퍼티를 변경할 수 있다.

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// 변경 불가 (오류 발생)
//rangeOfFourItems.firstValue = 6

// 지연 저장 프로퍼티
// 값이 처음 사용되기 전까지 계산되지 않는 프로퍼티
// 지연 저장 프로퍼티는 var 변수로 선언
// ==> 처음 사용되기 전까지 값을 갖지 않는 프로퍼티이기 때문

class DataImporter {
  var filename = "data.txt"
}

class DataManager {
  lazy var importer = DataImporter()
  var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
manager.importer
// DataImporter 인스턴스는 이 시점에 생성돼 있지 않다.

// 이 시점에 DataImporter 인스턴스 생성
manager.importer.filename

// 지연 프로퍼티가 여러 스레드에서  사용되면 지연 프로퍼티가 한번만 실행되는 걸 보장하지 않는다.
// 단일 스레드에서 사용되면 초기화는 한번만 하게 된다.

// 계산 프로퍼티
// 실제 값을 저장하고 있는 것이 아니라 getter와 setter를 제공해 값을 탐색하고 간접적으로 다른 프로퍼티 값을 설정할 수 있는 방법을 제공
struct Point {
  var x = 0.0, y = 0.0
}

struct Size {
  var width = 0.0, height = 0.0
}

struct Rect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      print(1111)
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    
    set(newCenter) {
      print(2222)
      print(origin)
      print(newCenter)  // 새로 값을 할당한
      origin.x = newCenter.x - (size.width / 2)
      origin.y = newCenter.y - (size.height / 2)
    }
  }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center

// square.center의 값을 변경할 때 setter 실행
square.center = Point(x: 15.0, y: 15.0)
print(square.origin)


// Setter 선언의 간략한 표현
struct AlternativeRect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    
    set {
      // 따로 이름을 정하지 않을 경우 newValue가 기본값
      origin.x = newValue.x - (size.width / 2)
      origin.y = newValue.y - (size.height / 2)
    }
  }
}

// 읽기전용
// getter만 있는 경우
// 읽기 전용이여도 계산 값에 따라 값이 변할 수 있으므로 var로 선언

struct Cuboid {
  var width = 0.0, height = 0.0, depth = 0.0
  var volume: Double {
    return width * height * depth
  }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print(fourByFiveByTwo.volume)

print("\n---------- [ Property Observer ] ----------\n")

// 프로퍼티 옵저버
// 값이 설정될 때마다 이벤트를 감지하는 옵저버
// willSet : 값이 저장되기 바로 직전에 호출 (새 값의 파라미터명 지정 가능, 지정하지 않을 경우 newValue)
// didSet : 새 값이 저장되고 난 후에 호출 (바뀌기 전의 값의 파라미터명 지정 가능, 지정하지 않을 경우 oldValue)

class StepCounter {
  var totalSteps: Int = 0 {
    willSet(newTotalSteps) {
      print(newTotalSteps)
    }
    didSet {
      print("totalSteps : \(totalSteps), oldValue : \(oldValue)")
      if totalSteps > oldValue {
        print(totalSteps - oldValue)
      }
    }
  }
}

let stepCounter = StepCounter()
stepCounter.totalSteps
stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 896

print("\n---------- [ Type Properties ] ----------\n")

// 타입 프로퍼티
// 특정 타입에 속한 프로퍼티로 그 타입에 해당하는 단 하나의 프로퍼티만 생성
// 특정 타입의 모든 인스턴스에 공통으로 사용되는 값을 정의할때 유용
// 타입 프로퍼티 선언을 위해서는 static 키워드를 사용
// (클래스에서는 static과 class 2가지 형태의 타입 프로퍼티) ==> class로 선언된 프로퍼티는 서브클래스에서 오버라이딩 가능 (static은 singleton 생각하면 됨,

struct SomeStructure {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
    return 1
  }
}

enum SomeEnumeration {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
    return 6
  }
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)

print(SomeEnumeration.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)

struct AudioChannel {
  static let thresholdLevel = 10
  static var maxInputLevelForAllChannels = 0
  var currentLevel: Int = 0 {
    didSet {
      if currentLevel > AudioChannel.thresholdLevel {
        currentLevel = AudioChannel.thresholdLevel
      }
      if currentLevel > AudioChannel.thresholdLevel {
        AudioChannel.maxInputLevelForAllChannels = currentLevel
      }
    }
  }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
