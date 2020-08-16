//: [Previous](@previous)

// 구조체

/*:
struct 구조체_이름 {
  // 구조체 정의 내용이 들어갈 부분
}
*/

import Foundation

struct BasicInformation {
  let name: String
  var age: Int
}

var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
yagomInfo.age = 100

// yagomInfo의 값을 복사하여 할당
var friendInfo: BasicInformation = yagomInfo
friendInfo.age
friendInfo.age = 999
friendInfo.age
yagomInfo.age

func changeBasicInfo(_ info: BasicInformation) {
  var copiedInfo: BasicInformation = info
  copiedInfo.age = 1
}

changeBasicInfo(yagomInfo)
print(yagomInfo.age)

struct Resolution {
  var width = 0
  var height = 0
  
  func desc() -> String {
    return "Resolution 구조체"
  }
}

// Resolution 구조체에 대한 인스턴스 생성
// inRes 상수에 할당
let insRes = Resolution()

// 인스턴스 속성에 접근
let width = insRes.width
print("insRes 인스턴스의 width 값은 \(width)입니다")

//: [Next](@next)
