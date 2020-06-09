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
//: [Next](@next)
