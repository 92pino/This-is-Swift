//: [Previous](@previous)

import Foundation

/*:
 # While 문
 
 조건이 거짓이 될 때까지 구문을 반복
*/
// while 문
var square = 0
var diceRoll = 0

while square < finalSquare {
  diceRoll += 1
  if diceRoll == 7 { diceRoll  = 1 }
  square += diceRoll
  if square < board.count { square += board[square]}
}

// repeat ~ while 문
// 구문을 최소 한번 이상 실행하고 while 조건이 거짓일 떄까지 반복
//: [Next](@next)
