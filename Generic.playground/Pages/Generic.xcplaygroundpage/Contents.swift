import UIKit

// 제네릭
// 어떤 타입으로도 작업할 수 있다를 의미
struct IntStack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
// <Element>로 타입 지정이되었지만 Double로도 사용될수 있고
var integerStack: IntStack<Double> = IntStack<Double>()

integerStack.push(3)
print(integerStack.items)

integerStack.push(2)
print(integerStack.items)

integerStack.push(3)
print(integerStack.items)

integerStack.push(5)
print(integerStack.items)

integerStack.pop()
print(integerStack.items)

integerStack.pop()

// <Element>로 타입 지정이되었지만 String으로도 사용될수 있다. (지정하기 나름)
var stringStack: IntStack<String> = IntStack<String>()
stringStack.push("1")
print(stringStack.items)

//: [Next](@next)
