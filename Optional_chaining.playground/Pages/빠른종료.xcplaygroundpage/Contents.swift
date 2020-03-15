//: [Previous](@previous)
import Foundation

// 빠른종료의 핵심은 guard
// guard 구문은 if 구문과 유사하게 Bool 타입의 값으로 동작하는 기능
// guard 뒤에 true일 때 코드가 게속 실행 (if 구문과는 다르게 guard 구문은 항상 else 구문이 뒤따라와야한다.
// guard 뒤에 따라오는 값이 false 일 경우 else 블록 내부 코드를 실행

/*
    guard Bool 타입 값 else {
        예외사항 실행문
        제어문 전환 명령어
    }
*/

// if 구문과 guard 구문 비교
for i in 0...3 {
    if i == 2 {
        print(i)
    } else {
        continue
    }
}

for i in 0...3 {
    guard i == 2 else {
        continue
    }
    print(i)
}

func greet(_ person: [String: String]) {
    guard let name: String = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    
    print("hope the weather is nice in \(location)")
}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "Jenny"

greet(personInfo)

personInfo["location"] = "Korea"

greet(personInfo)

// 메서드 내부에서 guard 구문 옵셔널 바인딩 활용
func fullAddress() -> String? {
    var restAddress: String? = nil
    
    if let buildingInfo: Building = self.building {
        restAddress = buildingInfo.name
    } else if let detail = self.detailAddress {
        restAddress = detail
    }
    
    guard let rest: String = restAddress else { return nil }
    
    var fullAddress: String = self.province
    fullAddress += " " + self.city
    fullAddress += " " + self.street
    fullAddress += " " + rest
    
    return fullAddress
}


func enterClub(name: String?, age: Int) {
    guard let name: String = name, let age: Int = age, age > 19, name.isEmpty == false else { return
        print("You are too young to enter the club")
        return
    }
    
    print("Welcome \(name)")
}
//: [Next](@next)
