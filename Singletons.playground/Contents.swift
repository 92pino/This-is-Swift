import Cocoa

class Student {
  static let instance = Student()
  private init(){}
  
  var name: String = "Dev"
}

print(Student.instance.name)

// 오류 발생
//let obj = Student()

let obj = Student.instance
print(obj.name)
