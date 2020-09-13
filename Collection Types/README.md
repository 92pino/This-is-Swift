# Collection Type
- Array
- Set
- Dictionary

## Array
```swift
// 빈 배열 생성
var someInt: Int = []
var someAnotherInt = [Int]()
var someAnotherDoubles = Array(repeating: 0.0, count: 3)
```

**+** 를 이용하여 배열을 합칠수 있다
```swift
var sixInts = someInt + someAnotherInt
```

### 배열이 비었는지 확인
```swift
var shoppingList = ["Eggs", "Milk"]
shoppingList.isEmpty  // false
```

### 배열의 값과 인덱스가 필요할떄
enumerated() 메소드를 사용하여 인덱스와 값을 동시에 가져올 수 있다.

```swift
for (index, value) in shoppingList.enumerated() {
  print("Item \(index + 1): \(value)")
}
```

## Set
Set 형태로 저장되기 위해선 반드시 타입이 hashable이어야만 한다.
> hashable이란?  
> 