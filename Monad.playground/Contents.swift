import UIKit

// Monad
// 특정한 상태로 값을 포장하는 것
// 맵 함수를 지원하는 컨테이너 타입
// 값이 있을 수도 있고 없을 수도 있는 컨텍스트를 갖는 함수객체 타입

// context
// 컨텐츠를 담은 그 무엇인가
// ex) 물컵에 물이 담겨있으면 물은 컨텐츠고 물컵은 컨텍스트


// flatmap
// 포장된 값을 받아서 값이 있으면 포장을 풀어서 값을 처리한 후 포장된 값을 반환하고, 없으면 없는 대로 다시 포장하여 반환

func doubledEven(_ num: Int) -> Int? {
  if num % 2 == 0 {
    return num * 2
  }
  return nil
}

Optional(3).flatMap(doubledEven)

let optionalArr: [Int?] = [1, 2, nil, 5]

let mappedArr: [Int?] = optionalArr.map { $0 }
let flatmaappedArr: [Int] = optionalArr.flatMap { $0 }
let compactmappedArr: [Int] = optionalArr.compactMap { $0 }

print(mappedArr)
print(flatmaappedArr)
print(compactmappedArr)
