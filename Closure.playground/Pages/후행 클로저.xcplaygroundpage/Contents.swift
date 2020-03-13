import Foundation
//: [Previous](@previous)
// 후행 클로저
let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

let reversed: [String] = names.sorted() { (first: String, second: String) -> Bool in
    return first > second
}

// 후행 클로저 생략2
let reversed2: [String] = names.sorted { (first: String, second: String) -> Bool in
    return first > second
}

// 후행 클로저 생략3
let reversed3: [String] = names.sorted { (first, second) in
    return first > second
}

// 후행 클로저 생략4
let reversed4: [String] = names.sorted { ($0, $1)
    return $0 > $1
}

// 후행 클로저 생략5
let reversed5: [String] = names.sorted {
    return $0 > $1
}

// 후행 클로저 생략6
let reversed6: [String] = names.sorted {
    $0 > $1
}

// 후행 클로저 생략7
let reversed7: [String] = names.sorted(by: >)
//: [Next](@next)
