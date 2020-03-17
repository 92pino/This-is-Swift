import Foundation
//: [Previous](@previous)
// 메타 타입
// 타입의 타입

protocol SomeProtocol {}
class SomeClass: SomeProtocol {}

let intType: Int.Type = Int.self
let stringType: String.Type = String.self
let classType: SomeClass.Type = SomeClass.self
let protocolType: SomeProtocol.Protocol = SomeProtocol.self

var someType: Any.Type

someType = intType
print(someType)

someType = stringType
print(someType)

someType = classType
print(someType)

someType = protocolType
print(someType)
//: [Next](@next)
