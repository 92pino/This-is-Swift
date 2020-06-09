import UIKit

/*:
  
 # Optional
 
 값이 있을 수도, 없을 수도 있음을 나타내는 표현
 변수 또는 상수 값이 nil일 수도 있다는 것을 의미한다.
 
 nil은 옵셔널로 선언된 곳에서만 사용할 수 있다.
 
 옵셔널의 값을 옵셔널이 아닌 값으로 추출하는것을 __옵셔널 추출__ 이라고 한다.
 
*/

var myName: String? = "yagom"
print(myName)

myName = nil
print(myName)

func checkOptionalValue(value optionalValue: Any?) {
  switch optionalValue {
  case .none:
    print("This Optional variable is nil")
  case .some(let value):
    print("Value is \(value)")
  }
}
myName = "yagom"
checkOptionalValue(value: myName)

myName = nil
checkOptionalValue(value: myName)

let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers {
  switch number {
  case .some(let value) where value < 0:
    print("Negative value!! \(value)")
  case .some(let value) where value > 10:
    print("Large value!! \(value)")
  case .some(let value):
    print("Value \(value)")
  case .none:
    print("nil")
  }
}

/*
  
 # Optional 강제 추출
 
 옵셔널의 값을 가장 간단하지만 가장 위험한 방법으로 추출하는 방법
 옵셔널 뒤에 !를 붙여줘서 강제적으로 추철하여 반환
 
 런타임 오류의 가능성을 항상 내포하기 때문에 강제 추출 방식은 사용을 지양해야한다.
*/

var myNameForced: String? = "yagom"
print(myNameForced!)

/*:
 
 # 옵셔널 바인딩
 옵셔널에 값이 있다면 옵셔널에서 추출한 값을 일정 블록 안에서 사용할 수 있는 상수나 변수로 할당해서 옵셔널이 아닌 형태로 사용할수 있도록 해주는 것
 
*/

var myNameBinding: String? = "yagom"

if let name = myNameBinding {
  print("My name is \(name)")
} else {
  print("myName == nil")
}

if var name = myNameBinding {
  name = "wizplan"
  print("My name is \(name)")
} else {
  print("myName == nil")
}
