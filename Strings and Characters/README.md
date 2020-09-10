# 문자열과 문자

String은 Foundation 프레임워크의 NSString이 bridge된 타입이기 때문에 NSString의 메소드를 String에서 캐스팅 없이 사용 가능하다.  

String은 값 타입이다  
String이 다른 함수 혹은 메소드로부터 생성되면 String 값이 할당될 때 이전 String의 레퍼런스를 할당하는 것이 아니라 값을 복사해서 생성한다.

## 가장 기본적인 문자열
```swift
let something = "Some string literal value"
```

## 빈 문자열 초기화
```swift
var emptyString = ""
var anotherEmptyString = String()

// 문자열이 비었는지 확인
// isEmpty
if  emptyString.isEmpty {
  print("Nothing to see here")
}
```

