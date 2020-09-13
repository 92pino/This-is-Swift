# 문자열과 문자

String은 Foundation 프레임워크의 NSString이 bridge된 타입이기 때문에 NSString의 메소드를 String에서 캐스팅 없이 사용 가능하다.  

String은 값 타입이다  
String이 다른 함수 혹은 메소드로부터 생성되면 String 값이 할당될 때 이전 String의 레퍼런스를 할당하는 것이 아니라 값을 복사해서 생성한다.  
다시 말해 다른 메소드에서 할당 받은 문자열은 그 문자열을 수정해도 원본 문자열이 변하지 않는다.

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

## 문자열 카운트
```swift
var str = "abcdefghijklmnop"
str.count
```

## 문자열 인덱스로 특정 문자 접근
- startIndex
- endIndex
- index(before:)
- index(after:)
- index(:offsetBy:)

문자열의 인덱스를 벗어나게되면 런타임 에러 발생

### 문자열의 개별 문자를 접근하기
```swift
for index in greeting.indices {
  print("\(greeting[index]) ", terminator: "")
}
```

### 문자의 삽입과 삭제
- insert(:at:)
- insert(contentsOf: at:)
- remove(at:)
- removeSubrange(:)