import Foundation
//: [Previous](@previous)
func makeIncrement(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}

let incrementByTwo: (() -> Int) = makeIncrement(forIncrement: 2)
let incrementByTwo2: (() -> Int) = makeIncrement(forIncrement: 2)
let incrementByTen: (() -> Int) = makeIncrement(forIncrement: 10)
let first: Int = incrementByTwo()
let second: Int = incrementByTwo()
let third: Int = incrementByTwo()

let first2: Int = incrementByTwo2()
let second2: Int = incrementByTwo2()
let third2: Int = incrementByTwo2()

let ten: Int = incrementByTen()
let twenty: Int = incrementByTen()
let thirty: Int = incrementByTen()
//: [Next](@next)
