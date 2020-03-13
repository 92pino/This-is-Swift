import UIKit

// 접근제어
// 접근제어는 코드끼리 상호작용을 할 때 파일 간 또는 모듈 간에 접근을 제한할 수 있는 기능

// open, public, internal (default), fileprivate, private

// public
// public으로 접근수준이 지정된 요소는 어디서든 쓰일 수 있다.
// 자신이 구현된 파일, 소스파일이 속해있는 모듈, 모듈을 가져다 쓰는 모듈 등 모든 곳에서 사용할 수 있다.
// ex) 주로 프레임워크에서 외부와 연결될 인터페이스를 구현하는데 많이 사용
public struct Bool {
    // Default-initialize Boolean value to 'false'
    public init()
}

// open
// 공개 접근수준(public) 이상으로 높은 접근수준
// 클래스와 클래스의 멤버에서만 사용 가능

// public과의 차이
// - 개방 접근수준(open)을 제외한 다른 모든 접근수준의 클래스는 그 클래스가 정의된 모듈 안에서만 상속 가능
// - 개방 접근수준(open)을 제외한 다른 모든 접근수준의 클래스 멤버는 해당 멤버가 정의된 모듈 안에서만 재정의 가능
// - 개방 접근수준의 클래스는 그 클래스가 정의된 모듈 밖의 다른 모듈에서도 상속할 수 있다.
// - 개방 접근수준의 클래스 멤버는 해당 멤버가 정의된 모듈 밖의 다른 모듈에서도 재정의 가능

// 개방 접근수준으로 명시하는 것은 그 클래스를 다른 모듈에서도 부모클래스로 사용하겠다는 목적으로 클래스를 설계하고 코드를 작성했음을 의미

open class NSString: NSOBject, NSCopying, NSMutableCopying, NSSecureCoding {
    open var length: Int { get }
    open func character(at index: Int) -> unichar
    public init()
    public init?(coder aDecoder: NSCoder)
}

// internal
// 내부 접근수준
// 기본적으로 모든 요소에 암묵적으로 지정하는 기본 접근수준
// 소스파일이 속해 있는 모듈 어디서든 쓰일 수 있다.
// 다만 그 모듈을 가져다 쓰는 외부 모듈에서는 접근 불가능

// fileprivate
// 파일외부비공개 접근수준
// 그 요소가 구현된 소스파일 내부에서만 사용할 수 있다.
// 해당 소스파일 외부에서 값이 변경되거나 함수를 호출하면 부작용이 생길 수 있는 경우에 사용

// private
// 비공개 접근수준
// 가장 한정적인 범위
// 그 기능을 정의하고 구현한 범위 내에서만 사용할 수 있다.
// 같은 소스파일 안에 구현한 다른 타입이나 기능에서도 사용 불가능
//: [Next](@next)
