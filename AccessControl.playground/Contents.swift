import UIKit

// 접근제어
// 코드끼리 상호작용을 할 때 파일 간 또는 모듈 간에 접근을 제한할수 있는 기능
// 접근제어를 통해 코드의 상세 구현은 숨기고 허용된 기능만 사용하는 인터페이스를 제공 할 수 있다.
// 외부에서 보거나 접근하면 안 되는 코드를 제어하고 꼭 필요한 부부만 제공하기 위해서 접근제어를 사용



// 모듈
// 배포할 코드의 묶음 단위
// 통상적으로 하나의 프레임워크, 라이브러리, 애플리케이션이 모듈 단위
// import키워드를 사용해 불러온다.


// 소스파일
// 하나의 스위프트 소스 코드 파일을 의미

// 접근수준
// open, public, internal, fileprivate, private





// public 공개 접근수준
// 접근수준이 지정된 요소 어디서든 쓰일 수 있다.



// open 개방 접근수준
// open 키워드는 public 이상으로 높은 접근수준이며, 클래스와, 클래스의 멤버에서만 사용할 수 있다.


// internal 내부 접근수준
// 기본적으로 모든 요소에 암묵적으로 지정하는 기본 접근요소
// 소스파일이 속해 있는 모듈 어디에서든 쓰일 수 있다.


// fileprivate 파일외부비공개 접근수준
// 구현된 소스파일 내부에서만 사용할 수 있다.
// 소스파일 외부에서 값이 변경되거나 함수를 호출하면 부작용이 생길수 있는 경우에 사용


// private 비공개 접근수준
// 기능을 정의하고 구현한 범위 내에서만 사용할 수 있다.
// 같은 소스 파일 안에 구현한 다른 타입이나 기능에서도 사용 불가능

open class OpenClass {
  open var openProperty: Int = 0
  public var publicProperty: Int = 0
  internal var internalProperty: Int = 0
  fileprivate var filePrivateProperty: Int = 0
  private var privateProperty: Int = 0
  
  open func openMethod() {}
  public func publicMethod() {}
  internal func internalMethod() {}
  fileprivate func filePrivateMethod() {}
  private func privateMethod() {}
}



// 접근제어 구현 참고사항

// 1. 모든 타입에 적용되는 접근수준의 규칙은 '상위 요소ㅗㅂ다 하위 요소가 더 높은 접근수준을 가질 수 없다.
private class AClass {
  // 공개 접근수준을 부여해도 AClass의 접근수준이 비공개적 접근수준이므로
  // 공개 접근수준의 메서드의 접근수준도 비공개 접근수준으로 취급된다.
  public func someMethod() {
    // ...
  }
}

