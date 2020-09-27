//
//  AppDelegate.swift
//  FCM_Test
//
//  Created by JinBae Jeong on 2020/09/20.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self
      // 사용할 UNAuthorizationOptions 옵션들
      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    
      // 권한 요청
      UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { _, _ in }
    } else {
      let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
    }
    
    // APNS 등록
    application.registerForRemoteNotifications()
    
    // Firebase 초기 셋팅
    FirebaseApp.configure()
    
    Messaging.messaging().delegate = self
    
    return true
  }
  
  
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    
    
    if #available(iOS 13.0, *) {
      // iOS 13 환경에서 Base16-encoded / hexadecimal string으로 표현
      let deviceTokenString = deviceToken.reduce("", { $0 + String(format: "%02X", $1) })
      dump("\n---------- [ Log : deviceToken - \(deviceTokenString) ] ----------\n")
    } else {
      // iOS 12 환경에서는 deviceToken 데이터를 String으로 가공
      var deviceTokenString = String(format: "%@", deviceToken as CVarArg)
      deviceTokenString = deviceTokenString.replacingOccurrences(of: "<", with: "")
      dump("\n---------- [ Log : deviceToken - \(deviceTokenString) ] ----------\n")
    }
    
    Messaging.messaging().apnsToken = deviceToken
    
    // 앱을 다시 시작해도 설정 값을 유지하고 싶을 경우
    // Messaging.messaging().isAutoInitEnabled = true
  }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
  // MARK: - willPresent : 앱이 포그라운드에 있을 때 호출되는 메서드
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    
  }
  
  // MARK: - didReceive : Notification의 응답에 대한 처리를 하는 메서드
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    
  }
}

extension AppDelegate: MessagingDelegate {
  // MARK: - didReceiveRegistrationToken : 토큰 갱신을 모니터링  (토큰이 업데이트될 때마다 알림 받기 위한 메서드)
  /*
   토큰이 갱신되는 경우
   - 새 기기에서 앱을 복원할 경우
   - 사용자가 앱을 삭제 및 재설치 할 경우
   - 사용자가 앱 데이터 소거할 경우
  */
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
    let dataDic: [String: String] = ["token": fcmToken]
    
    NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDic)
  }
  
  func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
    dump("\n---------- [ Log didReceive : \(messaging) ] ----------\n")
  }
}
