//: [Previous](@previous)

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
//: [Next](@next)
