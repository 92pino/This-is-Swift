import Cocoa

let b = 10
var a = 5
a = b
print(a, b) // 10, 10

// 튜플
let (x, y) = (1, 2)
print(x, y)

1 + 1
5 - 3
2 * 3
10.0 / 2.5

"Hello, " + "world"

9 % 4
-9 % 4

let three = 3
let minusThree = -three
let plusThree = -minusThree

let minusSix = -6
let alsoMinusSix = +minusSix

a = 1
a += 2

let c = a += 2

1 + 3

let name = "world"
if name == "world" {
  print("hello, world")
} else {
  print("I'm sorry \(name), but I don't recognize you")
}

(1, 2, 3, 4) == (1, 2, 3, 4)

("blue", 1) < ("purple", 1)

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in  0..<count {
  print("Person \(i + 1) is called \(names[i])")
}

for name in names[2...] {
  print(name)
}

