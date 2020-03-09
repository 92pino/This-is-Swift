import UIKit

func sayHelloToFriends(me: String, friends names: String...) -> String {
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend)!" + " "
    }
    
    result += "I'm " + me + "!"
    return result
}

print(sayHelloToFriends(me: "yagom", friends: "Johansson", "Jay", "Wizplan"))
print(1)

var numbers: [Int] = [1, 2, 3]

func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers[1])

referenceParameter(&numbers)
print(numbers[1])

func sayHelloWorld() {
    print("Hello, world!")
}
sayHelloWorld()

func sayHello(from myName: String, to name: String) {
    print("Hello \(name) I'm \(myName)")
}
sayHello(from: "yagom", to: "Mijeong")

typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: CalculateTwoInts = addTwoInts

print(mathFunction(2, 5))

mathFunction = multiplyTwoInts
print(mathFunction(2, 5))

func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

// 중첩함수
typealias MoveFunc = (Int) -> Int

//func goRight(_ currentPosition: Int) -> Int {
//    return currentPosition + 1
//}
//
//func goLeft(_ currentPosition: Int) -> Int {
//    return currentPosition - 1
//}
//
//func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
//    return shouldGoLeft ? goLeft : goRight
//}
//
//var position: Int = 3
//
//let moveToZero: MoveFunc = functionForMove(position > 0)
//print("원점으로 갑니다")
//
//while position != 0 {
//    print("\(position)...")
//    position = moveToZero(position)
//}
//print("원점 도착")

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currentPosition: Int) -> Int {
        return currentPosition + 1
    }
    
    func goLeft(_ currentPosition: Int) -> Int {
        return currentPosition - 1
    }
    
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = -4

let moveToZero: MoveFunc = functionForMove(position > 0)

while position != 0 {
    print("\(position)...")
    position = moveToZero(position)
}


func say(_ something: String) -> String {
    print("Something")
    return something
}

@discardableResult func discadaableResultSay(_ something: String) -> String {
    print(something)
    return something
}

say("Hello")
