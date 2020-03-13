import UIKit

// 클로저
// 일정 기능을 하는 코드를 하나의 블록으로 모아놓은 것을 의미
// 클로저는 스스로 메모리 관리한다.

let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second
}

let reversed: [String] = names.sorted(by: backwards)
print(reversed)

// 위 코드를 클로저로 축약

// 기본 클로저
/*
 클로저 표현 형식
 
 { (매개변수들) -> 반환 타입 in
    실행코드
 }
*/

let reversed2: [String] = names.sorted(by: {(first: String, second: String) -> Bool in
    return first > second
})
//: [Next](@next)
