import Cocoa

// 멤버와이즈 초기화

struct Foo {
  var a: Int
  var b: Int = 0
}

// b는 최초의 값을 0으로 지정하였지만 다른 값으로 대입할 수 있다.
var foo = Foo(a: 0, b: 3)

// 동일한 struct
struct Foo2 {
  var a: Int
  var b: Int = 0
  
  init(a: Int, b: Int) {
    self.a = a
    self.b = b
  }
}
