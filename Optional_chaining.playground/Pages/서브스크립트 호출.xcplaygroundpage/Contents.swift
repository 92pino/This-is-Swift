//: [Previous](@previous)
// 옵셔널 체이닝을 통한 서브스크립트 호출
import Foundation

let optionalArray: [Int]? = [1, 2, 3]
optionalArray?[1]

var optionalDictionary: [String: [Int]]? = [String: [Int]]()
optionalDictionary?["numberArray"] = optionalArray
optionalDictionary?["numberArray"]?[2]
//: [Next](@next)
