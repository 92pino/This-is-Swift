//: [Previous](@previous)

import Foundation

class Person {
  var height: Float = 0.0
  var weight: Float = 0.0
}

var yagom: Person = Person()
var friend: Person = yagom

yagom.height
friend.height

friend.height = 185.5
yagom.height
friend.height

func changePersonInfo(_ info: Person) {
  info.height = 155.3
}

changePersonInfo(yagom)
print(yagom.height)

var yagom2: Person = Person()
let friend2: Person = yagom
let anotherFriend: Person = Person()

print(yagom2 === friend2)
print(yagom2 === anotherFriend)
print(friend2 !== anotherFriend)

class VideoMode {
  var interlaced = false
  var frameRate = 0.0
  var name: String?
  
  func desc() -> String {
    return "VideoMode 클래스"
  }
}

let insVMode = VideoMode()

insVMode.desc()

let video = VideoMode()
video.name = "Original Video Instance"

print("video 인스턴스의 name 값은 \(video.name!) 입니다.")

let dvd = video
dvd.name = "DVD Video Instance"

print("video 인스턴스의 name 값은 \(video.name!)입니다.")
//: [Next](@next)
