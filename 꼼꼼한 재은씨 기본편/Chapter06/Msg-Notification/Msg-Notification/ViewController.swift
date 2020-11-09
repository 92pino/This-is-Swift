//
//  ViewController.swift
//  Msg-Notification
//
//  Created by JinBae Jeong on 2020/11/09.
//

/*:
 
 UserNotifications
 
 - UNMutableNotificationContent
    - 알림에 필요한 메시지와 같은 기본적인 속성을 담는 알림 콘텐츠 역할
    - 로컬 알림 타이틀, 서브 타이틀, 알림 메시지, 배지, 사운드 설정 가능
 - UNTimeIntervalNotificationTrigger
    - 알림 발송 조건 관리
    - 발생 시간과 반복 여부 설정 가능
    - 초단위
 - UNNotificationRequest
    - UNMutableNotificationContent과 UNTimeIntervalNotificationTrigger를 모아 알림 요청 객체 생성
 - UNUserNotificationCenter
    - 실제 발송 담당하는 싱글톤
  
*/

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

