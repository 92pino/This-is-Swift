import Foundation
//: [Previous](@previous)
// 디이니셜라이저
// 클래스의 인스턴스에서만 구현할 수 있다.
// 클래스의 인스턴스가 메모리에서 소멸되기 바로 직전에 호출
// deinit 키워드를 사용하여 구현

class SomeClass {
    deinit {
        print("Instance will be deallocated immediately")
    }
}

var instance: SomeClass? = SomeClass()
instance = nil

class FileManager {
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func openFile() {
        print("Open File: \(self.fileName)")
    }
    
    func modifyFile() {
        print("Modify File: \(self.fileName)")
    }
    
    func writeFile() {
        print("Write File: \(self.fileName)")
    }
    
    func closeFile() {
        print("Close File: \(self.fileName)")
    }
    
    deinit {
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager: FileManager? = FileManager(fileName: "abc.txt")

if let manager: FileManager = fileManager {
    manager.openFile()
    manager.modifyFile()
}

fileManager = nil
//: [Next](@next)
