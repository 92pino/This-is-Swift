
// 메서드
// 메서드는 특정 타입에 관련된 함수

// 인스턴스 메서드
// 특정 타입의 인스턴스에 속한 함수를 뜻한다.
// 인스턴스 내부의 프로퍼티 값을 변경하거나 특정 연산 결과를 반환하는 등 인스턴스와 관련된 기능을 실행

import Foundation

class LevelClass {
    // 현재 레벨을 저장하는 저장 프로퍼티
    var level: Int = 0 {
        // 프로퍼티 값이 변경되면 호출하는 프로퍼티 감시자
        didSet {
            print("Level \(level)")
        }
    }
    
    // 레벨이 올랐을 때 호출할 메서드
    func levelUp() {
        print("Level up")
        level += 1
    }
    
    // 레벨이 감소했을 때 호출할 메서드
    func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    func reset() {
        print("Reset")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.levelUp()
levelClassInstance.levelDown()
levelClassInstance.jumpLevel(to: 10)
levelClassInstance.levelDown()
levelClassInstance.reset()

struct LevelStruct {
    var level: Int = 0 {
        didSet {
            print("Level \(level)")
        }
    }
    
    // 구조체, 열거형에서는 값 타임이므로 mutating 키워드를 붙여 해당 메서드가 인스턴스 내부의 값을 변경한다는 것을 명시해야한다.
    mutating func levelUp() {
        print("Level up")
        level += 1
    }
}
//: [Next](@next)
