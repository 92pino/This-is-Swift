import Cocoa

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
  return s1 > s2
}

var reversedNames = names.sorted(by: backward)

// 축약 과정
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
  return s1 > s2
})

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2})

// 암시적 반환
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

// 인자 축약
reversedNames = names.sorted(by: { $0 > $1 })

// 연산자 메서드
reversedNames = names.sorted(by: >)

// 후위 클로저
func someFunctionThatTakesAClosure(closure: () -> Void) {
  // function body goes here
}

// 후위 클로저로 변형
someFunctionThatTakesAClosure {
  // closure's body goes here
}


// reversedNames를 후위클로저로 변형할 수 있다
reversedNames = names.sorted { $0 > $1 }

let digitNames = [
  0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

// 타입 추론에 의해 strings는 배열
let strings = numbers.map { (number) -> String in
  var number = number
  var output = ""
  repeat {
    output = digitNames[number % 10]! + output
    number /= 10
  } while number > 0
  return output
}

// 값 캡쳐
// 원본값이 사라지더라도 클로져의 body 안에서 그 값을 활용할 수 있다.
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
  var runningTotal = 0
  func incrementer() -> Int {
    runningTotal += amount
    return runningTotal
  }
  print(runningTotal, amount)
  return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
incrementByTen()

// escaping closure
// 클로저를 함수의 파라미터로 사용해서 함수가 끝나고 실행되는 클로저를 escaping closure라고 한다.

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
  completionHandlers.append(completionHandler)
}

class SomeClass {
  var x = 10
  func doSomething() {
    someFunctionWithEscapingClosure {
      self.x = 100
    }
  }
}
let instance = SomeClass()
instance.doSomething()
instance.x

completionHandlers.first?()
print(instance.x)

// 자동 클로저 (Auto Closure)
// 클로저를 실행하기 전까지 실제 실행이 되지 않아 계산이 복잡한 연산을 하는데 유용
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// customerProvider가 실행 될때 카운트 감소
customerProvider()
print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
  print("Now serving \(customerProvider())!")
}
serve(customer: {customersInLine.remove(at: 0)})

// autoClosure를 더 간결하게 @autoclosure로 사용할수 있다
func serve(customer customerProvider: @autoclosure () -> String) {
  print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
