//: [Previous](@previous)

import Foundation

/*:
 # Dictionary
 
 [Key: Value] 형태로 이루어진 순서가 정해지지 않은 컨테이너
*/

var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "Sixteen"
print(namesOfIntegers)

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print(airports)

typealias StringIntDictionary = [String: Int]

var numberForName: StringIntDictionary = [:]
print(numberForName.isEmpty)
print(numberForName.count)
numberForName = ["yagom": 100, "chulsoo": 200, "jenny": 300]

print(numberForName.isEmpty)
print(numberForName.count)

//print(numberForName["chulsoo"])
//print(numberForName["minji"])
//numberForName["chulsoo"] = 150
//print(numberForName["chulsoo"])
//
//numberForName["max"] = 999
//print(numberForName["max"])
//
//print(numberForName.removeValue(forKey: "yagom"))
//
//print(numberForName.removeValue(forKey: "yagom"))
//: [Next](@next)
