import Cocoa

// 구조체와 클래스의 공통점
/*
  
 - 값을 저장하기 위한 프로퍼티 정의
 - 기능을 제공하기 위한 메서드 정의
 - subscript 문법을 이요해 특정 값을 접근할수 있는 subscript 정의
 - 초기 상태를 설정할 수 있는 initializer 정의
 - 기본 구현에서 기능 확장(extensions)
 - 특정한 종류의 표준 기능을 제공하기 위한 프로토콜 순응
 
*/

// 클래스만 가능한 기능
/*
 
 - 상속 : 클래스의 여러 속성을 다른 클래스에 넘겨줌
 - 타입 캐스팅 : 런타임에 클래스 인스턴스의 타입을 확인
 - 소멸자 : 할당된 자원을 해제 (deinit)
 - 참조 카운트 : 클래스 인스턴스에 하나 이상의 참조 가능 (reference Count), ARC
 
 */

// 기본 구현 방법
class SomeClass {
  
}

struct SomeStruct {
  
}

struct Resolution {
  var width = 0
  var height = 0
}

class VideoMode {
  var resolution = Resolution()
  var interlaced = false
  var frameRate = 0.0
  var name: String?
}

// 클래스와 구조체의 인스턴스
let someResolution = Resolution()
let someVideoMode = VideoMode()
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

// 구조체, 열거형 === 값타입
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
print(cinema.width)
print(hd.width)

// cinema.width에 2048을 할당하였지만 기존의 hd값은 바뀌지않았다 ==> 두 인스턴스가 완전이 다른 개체로 다른 주소 공간에 저장되어 사용 (값이 복사되서 전달), 기존값에 영향이 없다.
// enum도 마찬가지
enum CompassPoint {
  case north, south, east, west
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection = .east
print(currentDirection, rememberedDirection)

// 클래스 === 참조타입
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print(alsoTenEighty.frameRate, tenEighty.frameRate)

// 새로운 인스턴스에 값을 할당했을 때 기존 인스턴스의 값도 바뀜 ==> 두 인스턴스가 같은 메모리 주소를 바라보고있다.(참조), 기존값에 영향이 있디.


// 식별 연산자
/*
 
 === : 두 상수나 변수가 같은 인스턴스를 참조하고 있는 경우 참
 !== : 두 상수나 다른 인스턴스를 참조하고 있는 경우 참
 
 ===는 참조를 비교
 ==는 값을 비교
 
 */

/*
 
 애플에서는 다음의 경우에는 클래스 대신 구조체를 사용하는게 좋다고 한다.
 
 - 구조체의 주 목적이 관계된 간단한 값을 캡슐화 하기 위한 경우
 - 구조체의 인스턴스가 참조되기 보다 복사되기를 기대하는 경우
 - 구조체에 의해 저장된 어떠한 프로퍼티가 참조되기 보다 복사되기를 기대하는 경우
 - 구조체가 프로퍼티나 메소드 등을 상속할 필요가 없는 경우
 
 */

struct PositionValue {
  var x = 0
  var y = 0
}

class PositionObject {
  var x = 0
  var y = 0
}

var v = PositionValue()
var o = PositionObject()

var v2 = v
var o2 = o

v2.x = 12
v2.y = 34

print(v.x, v.y, v2.x, v2.y)
