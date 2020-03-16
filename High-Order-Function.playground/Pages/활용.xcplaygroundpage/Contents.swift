//: [Previous](@previous)

import Foundation

let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7]

// 짝수를 걸러내고 (filter)
// 걸러낸 값을 각각 3씩 곱해준 후
// 걸러내고 곱한 모든 값을 더한다
// 2, 4, 6
// 6, 12, 18
// 6 + 12 + 18
var result: Int = numbers.filter{ $0 % 2 == 0 }.map{ $0 * 3 }.reduce(0) { $0  + $1 }
print(result)   // 36

enum Gender {
    case male, female, unknown
}

struct Friend {
    let name: String
    let gender: Gender
    let location: String
    var age: UInt
}

var friends: [Friend] = [Friend]()

friends.append(Friend(name: "Yoobato", gender: .male, location: "발리", age: 26))
friends.append(Friend(name: "JiSoo", gender: .male, location: "시드니", age: 24))
friends.append(Friend(name: "JuHyun", gender: .male, location: "경기", age: 30))
friends.append(Friend(name: "JiYoung", gender: .female, location: "서울", age: 22))
friends.append(Friend(name: "SungHo", gender: .male, location: "충북", age: 20))
friends.append(Friend(name: "JungKi", gender: .unknown, location: "대전", age: 29))
friends.append(Friend(name: "YoungMin", gender: .male, location: "경기", age: 24))

var result2: [Friend] = friends.map{ Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age + 1) }

result2 = result2.filter{ $0.location != "서울" && $0.age >= 25}
print(result2)

let string: String = result2.reduce("서울 외의 지역에 거주하며 25세 이상인 친구") { $0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)세"}
print(string)
//: [Next](@next)
