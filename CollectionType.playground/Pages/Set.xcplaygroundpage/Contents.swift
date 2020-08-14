//: [Previous](@previous)

import Foundation

/*:
 # Set
 
 Set 형태로 저장되기 위해서는 반드시 타입이 hashable
 Array와 마찬가지로 같은 타입만 넣을수 있다.
*/

var letters = Set<Character>()
print(letters.count)

letters.insert("a")
print(letters)
letters = []
print(letters)

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip Hop"]
print(favoriteGenres)

var favoriteGenres2: Set = ["Rock", "Classical", "Hip Hop"]
favoriteGenres2.update(with: "Ballad")
favoriteGenres2.remove("Classical")

// favoriteGenres2에서 Hip Hop을 가지는 인덱스 삭제
favoriteGenres2.remove(at: favoriteGenres2.firstIndex(of: "Hip Hop")!)
// Set은 중복된 값을 허용하지 않기 때문에 같은 값을 넣어도 변화가 없다.
favoriteGenres2.insert("Rock")
print(favoriteGenres2)

// Set의 특별한 메서드

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

// 합집합
print(oddDigits.union(evenDigits).sorted(by: <))
// 교집합 (중복된 값 출력)
print(oddDigits.intersection(evenDigits))
// A.subtracting(B) A에만 포함되어있는 집합
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted(by: <))
// 합집합 - 교집합
print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted(by: <))

// Set 동등 비교
let houseAnimals: Set = ["Dog", "Cat"]
let farmAnimals: Set = ["Cow", "Chicken", "Sheep", "Dog", "Cat"]
let cityAnimals: Set = ["Pigeon", "Mouse"]

// A.isSubset(of: B) A가 B에 포함이 되는지 true/false
houseAnimals.isSubset(of: farmAnimals)

// A.isSuperset(of: B) A가 B의 상위집합인지 true/false
farmAnimals.isSuperset(of: houseAnimals)

// A.isDisjoint(with: B) A와 B의 교집합이 없을때 true 교집합이 있을 경우 false
farmAnimals.isDisjoint(with: cityAnimals)

let colors: Set = ["red", "green", "blue"]
print(colors)
//: [Next](@next)
