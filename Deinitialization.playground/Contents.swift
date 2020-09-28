import Cocoa

/*

 initializer와는 반대로 인스턴스가 소멸되기 직전에 호출
 클래스 타입에서만 사용 가능
 
*/

class Bank {
  static var coinsInBank = 10_000
  static func distribute(coins numberOfCoinsRequested: Int) -> Int {
    let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
    coinsInBank -= numberOfCoinsToVend
    return numberOfCoinsToVend
  }
  static func receive(coins: Int) {
    coinsInBank += coins
  }
}

class Player {
  var coinsInPurse: Int
  init(coins: Int) {
    coinsInPurse = Bank.distribute(coins: coins)
  }
  func win(coins: Int) {
    coinsInPurse += Bank.distribute(coins: coins)
  }
  deinit {
    Bank.receive(coins: coinsInPurse)
  }
}

var playerOne: Player? = Player(coins: 100)
print(playerOne?.coinsInPurse)
print(Bank.coinsInBank)

playerOne?.win(coins: 2_000)
print(playerOne?.coinsInPurse)
print(Bank.coinsInBank)

playerOne = nil
Bank.coinsInBank
playerOne?.coinsInPurse
