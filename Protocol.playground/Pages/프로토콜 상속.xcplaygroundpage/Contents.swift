import Foundation
//: [Previous](@previous)
// 프로토콜은 하나 이상의 프로토콜을 상속받아 기존 프로토콜의 요구사항보다 더 많은 요구사항을 추가할 수 있다.

protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

class SomeClass: ReadWriteSpeakable {
    func read() {
        print("Read")
    }
    
    func write() {
        print("Write")
    }
    
    func speak() {
        print("Speak")
    }
}

// 클래스 타입에서만 채택하고 싶을 경우 맨 처음에 class 키워드 위치
protocol ClassOnlyProtocol: class, Readable, Writeable {
    // 추가 요구사항
}

class SomeClass2: ClassOnlyProtocol {
    func read() {
        
    }
    
    func write() {
        
    }
}

struct SomeStruct: ClassOnlyProtocol {
    func read() {
        
    }
    
    func write() {
        
    }
}
//: [Next](@next)
