import UIKit

// 옵셔널 체이닝
// 옵셔널에 속해 있는 nil일지도 모르는 프로퍼티, 메섣, 서브스크립션 등을 거져오거나 호출할 때 사용할 수 있는 일련의 과정
// 옵셔널에 값이 있다면 값을 호출하고, nil이라면 nil을 반환한다.

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
  var province: String
  var city: String
  var street: String
  var building: Building?
  var detailAddress: String?
  
  init(province: String, city: String, street: String) {
    self.province = province
    self.city = city
    self.street = street
  }
  
  func fullAddress() -> String? {
    var restAddress: String? = nil
    
    if let buildingInfo: Building = self.building {
      restAddress = buildingInfo.name
    } else if let detail = self.detailAddress {
      restAddress = detail
    }
    
    if let rest: String = restAddress {
      var fullAddress: String = self.province
      
      fullAddress += " " + self.city
      fullAddress += " " + self.street
      fullAddress += " " + rest
      
      return fullAddress
    } else {
      return nil
    }
  }
  
  func printAddress() {
    if let address: String = self.fullAddress() {
      print(address)
    }
  }

}

class Person {
  var name: String
  var address: Address?
  
  init(name: String) {
    self.name = name
  }
}

//let pino: Person = Person(name: "pino")
//
//let pinoRoomViaOptionalChaining: Int? = pino.address?.building?.room?.number
//
//var roomNumber: Int? = nil
//
//if let pinoAddress: Address = pino.address {
//  if let pinoBuilding: Building = pinoAddress.building {
//    if let pinoRoom: Room = pinoBuilding.room {
//      roomNumber = pinoRoom.number
//    }
//  }
//}
//
//if let number: Int = roomNumber {
//  print(number)
//} else {
//  print("Can not find room number")
//}
//
//if let roomNumber2: Int = pino.address?.building?.room?.number {
//  print(roomNumber)
//} else {
//  print("Can not find room number")
//}
//
//pino.address?.building?.room?.number = 505
////print(pino.address?.building?.room?.number)
////
//pino.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로", building: nil, detailAddress: nil)
//pino.address?.building = Building(name: "곰굴")
//pino.address?.building?.room = Room(number: 0)
//pino.address?.building?.room?.number = 505
//if let roomNumber2: Int = pino.address?.building?.room?.number {
//  print(roomNumber)
//} else {
//  print("Can not find room number")
//}
//
//pino.address?.fullAddress()?.isEmpty
//pino.address?.printAddress()

/*
 guard Bool 타입 값 else {
    예외사항 실행문
    제어문 전환 명령어
 }
*/

func greet(_ person: [String: String]) {
  guard let name: String = person["name"] else { return }
  
  print("Hello \(name)")
  
  guard let location: String = person["location"] else {
    print("I hope the weather is nice near you")
    return
  }
  
  print("I hope the weather is nice in \(location)")
}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "Jenny"
greet(personInfo)

personInfo["location"] = "Korea"
print(personInfo)
greet(personInfo)


func enterClub(name: String?, age: Int?) {
  guard let name: String = name, let age: Int = age, age > 19, name.isEmpty == false else {
    print("You are too young to enter the club")
    return
  }
  
  print("Welcome \(name)")
}

enterClub(name: nil, age: 18)
