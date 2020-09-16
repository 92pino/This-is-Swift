import Cocoa

// enum
// 관련된 값으로 이루어진 그룹으로 **공통의 타입** 으로 선언
// 계산 프로퍼티, 초기화 지정, 초기 선언을 해 확장 가능

enum SomeEnumeration {
  // enumeration definition goes here
}

enum CompassPoint {
  case north
  case south
  case east
  case west
}

// 초기화 할 때 타입추론되서 CompassPoint 타입을 갖는다.
// 한번 정의가 되면 다음 값이 할당될 때 축약형 문법을 사용해 .~~~로 사용 가능
var directionToHead = CompassPoint.west
// CompassPoint 형
directionToHead = .east

directionToHead = .south

// switch문은 모든 열거형을 포함해야하는데
// 만약 모든 열거형을 처리하지 않고 일부만 처리했을 경우 default를 사용해 나머지 경우에 대한 case를 정의해줘야 오류가 안난다.
switch directionToHead {
case .north:
  print("Lots of planets have a north")
case .south:
  print("Watch out for penguins")
case .east:
  print("Where the sun rises")
default:
  print("Where the skies are blue")
}

enum Barcode {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}

var productBarcode: Barcode = .upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

// switch case문에서 사용할 때 상수 혹은 변수로 선언이 가능하다
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
  print("QR code: \(productCode)")
}

// let을 앞으로 빼서 간결하게 표현 가능
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productCode):
  print("QR code: \(productCode)")
}

// 재귀 열거자
// 자기 자신을 재참조 하는 열거형
// 재귀 열거자 앞에 indirect를 붙여 표시
enum ArithmeticExpression {
  case number(Int)
  indirect case addition(ArithmeticExpression, ArithmeticExpression)
  indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression2 {
  case number(Int)
  case addition(ArithmeticExpression2, ArithmeticExpression2)
  case multiplication(ArithmeticExpression2, ArithmeticExpression2)
}

let five = ArithmeticExpression2.number(5)
let four = ArithmeticExpression2.number(4)
let sum = ArithmeticExpression2.addition(five, four)
let product = ArithmeticExpression2.multiplication(sum, ArithmeticExpression2.number(2))

func evaluate(_ expression: ArithmeticExpression2) -> Int {
  switch expression {
  case let .number(value):
    return value
  case let .addition(left, right):
    return evaluate(left) + evaluate(right)
  case let .multiplication(left, right):
    return evaluate(left) * evaluate(right)
  }
}
evaluate(product)
