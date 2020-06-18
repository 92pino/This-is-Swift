import UIKit

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
  let temporaryA: Int = a
  a = b
  b = temporaryA
}

var numOne: Int = 5
var numTwo: Int = 10
swapTwoInts(&numOne, &numTwo)

print("\(numOne), \(numTwo)")

func swapTwoStrings(_ a: inout String, _ b: inout String) {
  let temporaryA: String = a
  a = b
  b = temporaryA
}

var stringOne: String = "A"
var stringTwo: String = "B"

swapTwoStrings(&stringOne, &stringTwo)
print("\(stringOne), \(stringTwo)")

func swapTwoValues(_ a: inout Any, _ b: inout Any) {
  let temporaryA: Any = 0
  a = b
  b = temporaryA
}

var anyOne: Any = 1
var anyTwo: Any = "Two"

swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)")

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
  let temporaryA: T = a
  a = b
  b = temporaryA
}

swapTwoValues(&numOne, &numTwo)
print("\(numOne), \(numTwo)")
