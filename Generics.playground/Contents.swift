import Cocoa

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
  let temporaryA = a
  a = b
  b = temporaryA
}

struct IntStack {
  var items = [Int]()
  
  mutating func push(_ item: Int) {
    items.append(item)
  }
  
  mutating func pop() -> Int {
    return items.removeLast()
  }
}

// generic으로 구현
struct Stack<Element> {
  var items = [Element]()
  
  mutating func push(_ item: Element) {
    items.append(item)
  }
  
  mutating func pop() -> Element {
    return items.removeLast()
  }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.pop()
stackOfStrings.push("tres")


print(stackOfStrings.items)

extension Stack {
  var topItem: Element? {
    return items.isEmpty ? nil : items[items.count - 1]
  }
}

if let topItem = stackOfStrings.topItem {
  print(topItem)
}

// Equatable : 두 값 혹은 객체를 비교하는 경우에 == 를 사용하는데 반드시 Equatable 프로토콜을 따라야 하므로 <T: Equatable>을 채택
func findIndex<T: Equatable>(ofString valueToFind: T, in array: [T]) -> Int? {
  for (index, value) in array.enumerated() {
    if value == valueToFind {
      return index
    }
  }
  return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
  print(foundIndex)
}

protocol Container {
  associatedtype Item
}
