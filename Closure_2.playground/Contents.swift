import UIKit

// 클로저
// 일정 기능을 하는 코드를 하나의 블록으로 모아놓은 것
/*
 // 클로저의 세가지 형태
 
 - 이름이 있으면서 어떤 값도 획득하지 않는 전역함수 형태
 - 이름이 있으면서 다른 함수 내부의 값을 획득할 수 있는 중첩된 함수의 형태
 - 이름이 없고 주변 문맥에 따라 값을 획득할 수 있는 축약 문법으로 작성된 형태
 
*/

let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

func backwards(first: String, second: String) -> Bool {
  print("\(first) \(second) 비교중")
  return first > second
}

let reversed: [String] = names.sorted(by: backwards)
print(reversed)

// 후행 클로저의 사용
//let reversed2: [String] = names.sorted { (first: String, second: String) -> Bool in
//  return first > second
//}

// 문맥을 이용한 타입 유추
// 클로저의 매개변수 타입과 반환 타입을 생략하여 표현할 수 있다.
//let reversed2: [String] = names.sorted { (first, second) in
//  return first > second
//}

// 단축 인자 이름
//let reversed2: [String] = names.sorted {
//  return $0 > $1
//}

// 암시적 반환 표현

//let reversed2: [String] = names.sorted { $0 > $1 }
//
//
//func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
//  var runningTotal = 0
//  func incrementer() -> Int {
//    runningTotal += amount
//    return runningTotal
//  }
//
//  return incrementer
//}
//
//let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
//
//let first: Int = incrementByTwo()
//let second: Int = incrementByTwo()
//let third: Int = incrementByTwo()

// 클로저는 참조 타입




// 탈출 클로저
// 함수의 전달인자로 전달한 클로저가 함수 종료 후에 호출될 때 클로저가 함수를 탈출한다고 표현한다.
// 클로저를 매개변수로 갖는 함수를 선언할 때 매개변수 이름의 콜론 뒤에 @escaping 키워드를 사용하여 클로저가 탈출하는 것을 허용한다고 명시


var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
  completionHandlers.append(completionHandler)
}

typealias VoidVoidClosure = () -> Void
let firstClosure: VoidVoidClosure = {
  print("Closure A")
}

let secondClosure: VoidVoidClosure = {
  print("Closure B")
}


func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure {
  return shouldReturnFirstClosure ? first : second
}

let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)
returnedClosure()
