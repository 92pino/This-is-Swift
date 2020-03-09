/*:
 # 구조체
 - 값타입
 
 ```swift
 struct 구조체 이름 {
    프로퍼티와 메서드들
 }
 ```
 */

import UIKit

// 구조체 초기화
struct BasicInformation {
    let name: String
    var age: Int
}

// 구조체 인스턴스 생성
var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
// 구조체 인스턴스 사용
yagomInfo.age = 100

var friendInfo: BasicInformation = yagomInfo

print("yagom's age : \(yagomInfo.age)")
print("friend's age : \(friendInfo.age)")

friendInfo.age = 99

print("yagom's age : \(yagomInfo.age)")
print("friend's age : \(friendInfo.age)")

func changeBasicInfo(_ info: BasicInformation) {
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
}

changeBasicInfo(yagomInfo)
print(yagomInfo.age)
//: [Next](@previous)
