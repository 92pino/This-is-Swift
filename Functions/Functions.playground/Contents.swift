import Cocoa

func greet(person: String) -> String {
  let greeting = "Hello, " + person + "!"
  return greeting
}
print(greet(person: "Anna"))

func greetAgain(person: String) -> String {
  return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))

func sayHelloWorld() -> String {
  return "Hello, world"
}
print(sayHelloWorld())

func greet(person: String, alreadyGreeted: Bool) -> String {
  if alreadyGreeted {
    return greetAgain(person: person)
  } else {
    return greet(person: person)
  }
}
print(greet(person: "Tim", alreadyGreeted: true))

func printAndCount(string: String) -> Int {
  print(string)
  return string.count
}

func printWithoutCounting(string: String) {
  let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

func minMax(array: [Int]) -> (min: Int, max: Int) {
  var currentMin = array[0]
  var currentMax = array[0]
  for value in array[1..<array.count] {
    if value < currentMin {
      currentMin = value
    } else if value > currentMax {
      currentMax = value
    }
  }
  return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

func minMax2(array: [Int]) -> (min: Int, max: Int)? {
  var currentMin = array[0]
  var currentMax = array[0]
  
  for value in array[1..<array.count] {
    if value < currentMin {
      currentMin = value
    } else if value > currentMax {
      currentMax = value
    }
  }
  
  return (currentMin, currentMax)
}

if let bounds2 = minMax2(array: [8, -6, 2, 109, 3, 71]) {
  print("min is \(bounds2.min) and max is \(bounds2.max)")
}

func someFunction(firstParameterName: Int, secondParameter: Int) {
  // 함수 내부, 외부에서 firstParameterName, secondParameter를 사용
}
someFunction(firstParameterName: 1, secondParameter: 2)

func someFunction(argumentLabel parameterName: Int) {
  // 함수 내부에선 parameterName, 외부에선 argumentLabel 사용
}
someFunction(argumentLabel: 1)

func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
  // 함수 호출시 두번째 인자를 생략하면 함수 안에서 default값 (12)가 기본값으로 사용
}
someFunction(parameterWithoutDefault: 4)
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)

func swapTowInts(_ a: inout Int, _ b: inout Int) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTowInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func addTwoInts(_ a: Int, _ b: Int) -> Int {
  return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
  return a * b
}

func printHelloWorld() {
  print("Hello, world")
}

var mathFunction: (Int, Int) -> Int = addTwoInts(_:_:)
print("Result: \(mathFunction(2, 3))")
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
