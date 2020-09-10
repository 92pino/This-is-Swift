# 기본 연산자 (Basic Operators)

## 할당 연산자
할당 연산자는 값을 초기화 시키거나 변경하는 역할을 하고 상수, 변수 모두에 사용 가능하다. 
```swift
let b = 10
var a = 5
a = b

// 튜플을 이용해 여러값 한번에 할당 가능
let (x, y) = (1, 2)
``` 
ㄴ Swift에서는 할당 연산자는 값을 반환하지 않는데 동등비교연산자(==)를 사용해야 하는 곳에 할당연산자(=)가 실수로 사용되는 것을 막기 위함이다.

## 사칙 연산자
- \+ : 더하기
- \- : 빼기
- \* : 곱하기
- / : 나누기
- % : 나머지

```swift
1 + 2               // 3
5 - 3               // 2
2 * 3               // 6
10.0 / 2.5          // 4
"Hello, " + "World" // Hello, World
9 % 4               // 1
-9 % 4              // -1

var a = 1
a += 2              // 3

let b = a += 2  // 사용 불가
```

> 합성 할당 연산자는 값을 반환하지 않으므로 변수에 할당할 수 없다.

## 비교 연산자
- 같다(a == b || a === b)
- 같지않다 (a != b || a !== b)
- 크다 (a > b)
- 작다 (a < b)
- 크거나 같다 (a >= b)
- 작거나 같다 (a <= b)

> **==** 는 단순히 값이 같은지만 비교를 해주는 반면  
  **===** 는 값이 동일한 지 확인 한다 (둘 다 동일한 메모리 주소를 가리킴), 참조 유형 비교.

같은 타입을 갖고 있는 두개의 튜플도 비교가 가능하다  
비교는 왼쪽에서 오른쪽 방향으로 진행되고 한번에 한개의 값만 비교를 한다.

## 삼항 연산자
```question ? answer1 : answer2```의 구조  
참인 경우 answer1을 실행 거짓일 경우 answer2를 실행

```swift
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
```

## nil 병합 연산자
옵셔널을 벗겨서 만약 해당 값이 nil인 경우 기본 값을 반환한다.
```swift
let defaultColorName = "red"  // 기본값
var userDefinedColorName: String? // nil값

var colorNameToUse = userDefinedColorName ?? defaultColorName
```

## 범위 연산자

### 닫힌 범위 연산자
**a...b** 의 형태로 이루어진 시작과 끝이 있는 연산자  
```swift
for index in 1...5 {
  print("(index) times 5 is \(index * 5))
}
```

### 반 닫힌 범위 연산자
**a..<b** 의 형태로 a부터 b보다 작을 때까지의 범위(a ~ b-1)
```swift
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in  0..<count {
  print("Person \(i + 1) is called \(names[i])")
}
```

### 단방향 범위
**a...** 또는 **..a** 의 형태로 시작 또는 끝만 지정하는 범위 연산자  
지정한 시작값 혹은 끝 값은 범위에 포함이된다.  
subscript뿐만 아니라 특정값을 포함하는지 여부를 확인할 때도 사용 가능