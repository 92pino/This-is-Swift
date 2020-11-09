//
//  AppDelegate.swift
//  Msg-Notification
//
//  Created by JinBae Jeong on 2020/11/09.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().getNotificationSettings { settings in
        if settings.authorizationStatus == .authorized {
          let notiCenter = UNUserNotificationCenter.current()
          
          // 알림 컨텐츠 객체
          let nContent = UNMutableNotificationContent()
          nContent.badge = 1
          nContent.title = "로컬 알림 메시지"
          nContent.subtitle = "준비된 내용이 아주 많아요! 얼른 다시 앱을 열어주세요!!"
          nContent.body = "앗! 왜 나갔어요?? 어서 들어오세요!!"
          nContent.sound = UNNotificationSound.default
          nContent.userInfo = ["name": "홍길동"]
          
          // 알림 발송 조건 객체
          let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
          
          // 알림 요청 객체
          let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
          
          // 노티피케이션 센터에 추가
          notiCenter.add(request)
          notiCenter.delegate = self
          
        } else {
          print("사용자가 동의하지 않음!!!")
        }
      }
    } else {
      
    }
    
    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

