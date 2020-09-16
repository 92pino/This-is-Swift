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
  0: "Zero", 1: "One", 2: "Two", 3: "Three"
]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
  var number = number
  var output = ""
  repeat {
    output = digitNames[number % 10]! + output
    number /= 10
  } while number > 0
  return output
}

