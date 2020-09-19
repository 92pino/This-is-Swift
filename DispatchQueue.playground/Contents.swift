import UIKit

// DispatchQueue
/**

 - main
 - global
 - private(custom)

*/

/*
 ## DispatchQueue.main
 - 유일한 한개
 - serial
 - main Thread

*/

DispatchQueue.main.async {
  print(1111)
}

/*

 ## DispatchQueue.global
 - 서비스 품질별(Qos)별로 6가지가 나눠져있다.
 - 밑에서 위로 올라올수록 품질이 좋다
 - ==> 품질이 좋다는 것은
 - DispatchQueue.global(qos: .userInteractive) : 유저와 직접적 인터렉티브 --> UI업데이트, 애니메이션, UI반응 관련 어떤것이든 사용자와 상호 작용 (즉시 반응)
 - DispatchQueue.global(qos: .userInitiated) : 유저가 즉시 필요하긴 하지만, 비동기적으로 처리된 작업(ex. 앱 내에서 pdf 열기) (몇초)
 - DispatchQueue.global() : 디폴트 일반적인 작업
 - DispatchQueue.global(qos: .utility) : 주로 Progress Indicator과 함께 실행되는 작업 --> 계산, IO, Networking, 지속적인 데이터 feeds 할때 주로 사용 (몇초에서 몇분)
 - DispatchQueue.global(qos: .background) : 유저가 직접적으로 인지하지 않는 작업(데이터 가져오기, 데이터베이스 유지보수, 원격 서버 동기화 ...) (몇분 이상)
 - DispatchQueue.global(qos: .unspecified) : legacy API
 
*/

DispatchQueue.global().async {
  print(2222)
}

DispatchQueue.global(qos: .userInitiated).async {
  print(3333)
}

// queue를 background로 정의
let queue = DispatchQueue.global(qos: .background)
// 작업을 보낼 때 더 높은 수준으로 보낼 경우
queue.async(qos: .utility) {
  
}
// queue의 품질이 보내는 품질의 수준으로 올라간다.

/*

 ## Private(Custom Queue)
 
*/


print("\n---------- [ GCD ] ----------\n")

func task1() {
  print("Task 1 시작")
  sleep(2)
  print("Task 1 완료")
}

func task2() {
  print("Task 2 시작")
  print("Task 2 완료")
}

func task3() {
  print("Task 3 시작")
  sleep(1)
  print("Task 3 완료")
}

func task4() {
  print("Task 4 시작")
  sleep(3)
  print("Task 4 완료")
}

print("\n---------- [ Main Queue ] ----------\n")
let mainQueue = DispatchQueue.main

timeCheck
task1()

print("\n---------- [ Global Queue ] ----------\n")
let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)
