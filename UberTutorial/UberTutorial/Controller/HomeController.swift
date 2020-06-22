//
//  HomeController.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/22.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {
  
  // Mark: - Properties
  private let mapView = MKMapView()
  
  // Mark: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    checkIfUserIsLoggedIn()
//    signOut()
  }
  
  // MARK: - API
  func checkIfUserIsLoggedIn() {
    if Auth.auth().currentUser?.uid == nil {
      // 로그인 안된 상태
      DispatchQueue.main.async {
        let nav = UINavigationController(rootViewController: LoginController())
        self.present(nav, animated: true, completion: nil)
      }
    } else {
      // 로그인 된 상태
      configureUI()
    }
  }
  
  func signOut() {
    do {
      try Auth.auth().signOut()
    } catch {
      print("DEBUG: Error signing out")
    }
  }
  
  // MARK: - Helper Functions
  
  func configureUI() {
    view.addSubview(mapView)
    mapView.frame = view.frame
  }
  
  // Mark: - Action
  
}
