//: [Previous](@previous)

import Foundation

var name = (first: "Taylor", last: "Swift")
name.0
name.first

typealias PersonTuple = (name: String, age: Int, height: Double)

var person: PersonTuple = ("yagom", 100, 182.5)
print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")

person.1 = 99
person.2 = 178.5

print("이름: \(person.name), 나이: \(person.age), 신장: \(person.height)")

//: [Next](@next)
