//: [Previous](@previous)
// self 프로퍼티
// javasciprt 또는 java의 this와 비슷하게 인스턴스 자기 자신을 가리키는 프로퍼티
import Foundation

class LevelClass {
    var level: Int = 0
    
    func jumpLevel(to level: Int) {
        print("Jump to \(level)")
        print(self.level, level)
        self.level = 30
        print("Change Level \(self.level)")
        print(self.level, level)
    }
}

let lv = LevelClass()
lv.jumpLevel(to: 10)

enum OnOffSwitch {
    case on, off
    mutating func nextState() {
        self = self == .on ? .off : .on
    }
}

var toggle: OnOffSwitch = OnOffSwitch.off
toggle.nextState()
print(toggle)
//: [Next](@next)
