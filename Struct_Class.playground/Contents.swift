import UIKit

/*:
 
 # 구조체와 클래스
 
 - 구조체와 클래스는 데이터를 용도에 맞게 묶어 표현하고자 할 때 유용
 - 구조체와 클래스는 프로퍼티와 메서드를 사용하여 구조화된 데이터와 기능을 가질 수 있다.
 
 > 구조체, 열거형의 인스턴스는 값 타입
 > 클래스의 인스턴스는 참조 타입
 
*/

// 구조체

struct BasicInformation {
  var name: String
  var age: Int = 10
}

var yagomInfo = BasicInformation(name: "yagom")
print(yagomInfo.name, yagomInfo.age)
yagomInfo.age = 20
yagomInfo.name = "pino"

print(yagomInfo.name, yagomInfo.age)

let pinoInfo = BasicInformation(name: "pino")
print(pinoInfo.name, pinoInfo.age)

// let으로 선언해서 값 변경 불가
//pinoInfo.age = 20
//pinoInfo.name = "pino"

// 클래스
// 클래스는 부모클래스가 없더라도 상속 없이 단독으로 정의가 가능하다.

class Person {
  var height: Float = 0.0
  var weight: Float = 0.0
  
  deinit {
    print("Person 클래스의 인스턴스 소멸")
  }
}

var yagom: Person? = Person()
yagom!.height = 123.4
yagom!.weight = 123.4

// let으로 선언을 해도 참조 타입이므로 내부 프로퍼티를 변경할 수 있다.
let jenny: Person = Person()
jenny.height = 123.4
jenny.weight = 123.4

// 클래스의 인스턴스는 참조 타입이므로 더는 참조할 필요가 없을 때 메모리에서 해제된다.
// 클래스 내부에 deinit을 넣어놓으면 소멸되기 직전에 deinit 메서드가 호출된다.

yagom = nil


