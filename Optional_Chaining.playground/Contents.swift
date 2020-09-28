import Cocoa

/*
 
 옵셔널일 수 있는 인스턴스 내부의 프로퍼티, 메소드, 서브스크립트를 매번 nil 체크하지 않고 최종적으로 원하는 값, 혹은 nil 인지 판단하는 방법
 하나라도 nil일 경우 nil
 
*/

/*
class Person {
  var residence: Residence?
}

class Residence {
  var numberOfRooms = 1
}

let person = Person()
person.residence

if let roomCount = person.residence?.numberOfRooms {
  print(roomCount)
} else {
  print("Unable to retrieve the number of rooms.")
}

person.residence = Residence()


if let roomCount = person.residence?.numberOfRooms {
  print(roomCount)
} else {
  print("Unable to retrieve the number of rooms.")
}
 */

class Person {
  var residence: Residence?
}

class Residence {
  var rooms = [Room]()
  var numberOfRooms: Int {
    return rooms.count
  }
  subscript(i: Int) -> Room {
    get {
      print(i)
      return rooms[i]
    }
  }
  func printNumberOfRooms() {
    print("The number of rooms is \(numberOfRooms)")
  }
  var address: Address?
}

class Room {
  let name: String
  init(name: String) {
    self.name = name
  }
}

class Address {
  var buildingName: String?
  var buildingNumber: String?
  var street: String?
  func buildingIdentifier() -> String? {
    if let buildingNumber = buildingNumber, let street = street {
      return "\(buildingNumber) \(street)"
    } else if buildingName != nil {
      return buildingName
    } else {
      return nil
    }
  }
}

let john = Person()
if let roomCount = john.residence?.numberOfRooms {
  print("John's residence has \(roomCount) room(s).")
} else {
  print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
john.residence?.address = someAddress

func createAddress() -> Address {
  print("Function was called")
  let someAddress = Address()
  someAddress.buildingNumber = "29"
  someAddress.street = "Acacia Road"
  return someAddress
}
john.residence?.address = createAddress()

if let firstRoomName = john.residence?[0].name {
  print("The first room name is \(firstRoomName)")
} else {
  print("Unable to retrieve the first room name")
}

let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

print(john.residence?[1].name)
