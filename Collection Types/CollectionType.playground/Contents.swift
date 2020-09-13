import Cocoa

var someInts: [Int] = []
var someAnotherInts = [Int]()
var someDoubles = Array(repeating: 0.0, count: 3)

someInts.append(2)
someInts = []

var shoppingList: [String] = ["Eggs", "Milk"]
shoppingList = ["Eggs", "Milk"]

print(shoppingList.count)

shoppingList.isEmpty ? print("The shopping list is empty.") : print("The shopping list is not empty.")

var firstItem = shoppingList[0]
shoppingList[0...1] = ["Bananas", "Apples"]

for item in shoppingList {
  print(item)
}

for (index, value) in shoppingList.enumerated() {
  print(index, value)
}

var letters = Set<Character>()
print(letters.count)

letters.insert("a")
print(letters)
letters = []

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]
print(favoriteGenres2.count)

favoriteGenres2.insert("Jazz")
favoriteGenres2.remove("Rock")
print(favoriteGenres2)

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

// 합집합
oddDigits.union(evenDigits).sorted()

// 교집합
oddDigits.intersection(evenDigits).sorted()

// 합집합 - 교집합
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()

// 차집합
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()



var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixtenn"
namesOfIntegers
namesOfIntegers = [:]
namesOfIntegers

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
  print("\(animalName)s have \(legCount) legs")
}

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1

for _ in 1...power {
  answer *= base
}

