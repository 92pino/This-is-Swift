//: [Previous](@previous)
// 타입 메서드
// 타입 자체에 호출이 가능한 메서드
// static 키워드를 사용하여 타입 메서드임을 나타내준다.
// 클래스의 타입 메서드는 static / class 가 있다.
// static으로 정의하면 상속 후 메서드 재정의가 불가능
// class로 정의하면 상속 후 메서드 재정의가 가능
import Foundation

class AClass {
    static func staticTypeMethod() {
        print("AClass staticTypeMethod")
    }
    
    class func classTypeMethod() {
        print("AClass classTypeMethod")
    }
}

class BClass: AClass {
    override class func classTypeMethod() {
        
    }
    
    // 재정의 불가능
//    override static func staticTypeMethod() {
//
//    }
}


struct SystemVolume {
    // 타입 프로퍼티를 사용하면 언제나 유일한 값이 된다.
    static var volume: Int = 5
    
    // 타입 프로퍼티를 제어하기 위해 타입 메서트 사용
    static func mute() {
        print(self)
        self.volume = 0
    }
}

class Navigation {
    var volume: Int = 5
    
    func guideWay() {
        SystemVolume.mute()
    }
    
    func finishGuideWay() {
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10
print(SystemVolume.volume)
let myNavi: Navigation = Navigation()
myNavi.guideWay()
print(SystemVolume.volume)
myNavi.finishGuideWay()
print(SystemVolume.volume)
//: [Next](@next)
