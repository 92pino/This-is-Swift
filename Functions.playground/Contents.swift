import UIKit

func greet(person: String) -> String {
  let greeting = "Hello, " + person + "!"
  
  return greeting
}
greet(person: "Pino")

func greetAgain(person: String) -> String {
  return "Hello again, " + person + "!"
}

print(greetAgain(person: "Pino"))

func sayHelloWorld() -> String {
  return "Hello, world"
}

sayHelloWorld()

func greetParams(person: String, alreadyGreeted: Bool) -> String {
  if alreadyGreeted {
    return greetAgain(person: person)
  } else {
    return greet(person: person)
  }
}

greetParams(person: "Pino", alreadyGreeted: true)

func minMax(array: [Int]) -> (min: Int, max: Int)? {
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
//minMax(array: [8, -6, 2, 109, 3, 71])
//guard let bounds = minMax(array: [8, -6, 2, 109, 3, 71]).max != nil else { return }
//print(Self.bounds.max)

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
func test() {
  guard let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) else { return }
  
  print(bounds.max, bounds.min)
}
test()

// 함수 내부 외부에서 인자값을 참조할수있다 (firstParameterName,secoundParameter)
func someFunction(firstParameterName: Int, secoundParameter: Int) {
  
}

// 내부에서는 hometown, 외부에서는 from 사용
func greet(person: String, from hometown: String) -> String {
  return "Hello \(person)! Glad you could visit from \(hometown)"
}

greet(person: "Pino", from: "Seoul")

func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
  
}

someFunction(1, secondParameterName: 2)

// 인자값을 기본 파라미터로 넣을 경우 호출시 생략 가능, 호출 시 인자값을 넣을 경우 넣은 인자값으로 사용
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
  
}
someFunction(parameterWithoutDefault: 3)
someFunction(parameterWithoutDefault: 4, parameterWithDefault: 6)

func arithmeticMean(_ numbers: Double...) -> Double {
  var total: Double = 0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print(someInt, anotherInt)
