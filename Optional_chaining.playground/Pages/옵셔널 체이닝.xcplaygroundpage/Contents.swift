import UIKit

// 옵셔널 체이닝
// 옵셔널에 속해 있는 nil일지도 모르는 프로퍼티, 메서드, 서브스크립션 등을 가져오거나 호출할 때 사용할 수 있는 과정

class Room {
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
}

class Building {
    var name: String
    var room: Room?
    
    init(name: String) {
        self.name = name
    }
}

struct Address {
    var province: String        // 광역시/도
    var city: String            // 시/군/구
    var stree: String           // 도로명
    var building: Building?       // 건물
    var detailAddress: String?  // 건물 외 상세 주소
}

class Person {
    var name: String
    var address: Address?
    
    init(name: String) {
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")

let yagomRoomViaOptionalChaining: Int? = yagom.address?.building?.room?.number
print(yagomRoomViaOptionalChaining)

if let roomNumber: Int = yagom.address?.building?.room?.number {
    print(roomNumber)
} else {
    print("Can not find room number")
}

yagom.address?.building?.room?.number = 505
print(yagom.address?.building?.room?.number)

yagom.address = Address(province: "충청북도", city: "청주시 청원구", stree: "충청대로", building: nil, detailAddress: nil)
yagom.address?.building = Building(name: "곰굴")
yagom.address?.building?.room = Room(number: 0)
yagom.address?.building?.room?.number = 505

print(yagom.address?.building?.room?.number)
//: [Next](@next)
