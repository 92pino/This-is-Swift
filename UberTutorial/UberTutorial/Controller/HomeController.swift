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
  private let locationManager = CLLocationManager()
  
  private let inputActivationView = LocationInputActivationView()
  
  // Mark: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    checkIfUserIsLoggedIn()
    enableLocationServices()
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
    configureMapView()
    
    view.addSubview(inputActivationView)
    inputActivationView.centerX(inView: view)
    inputActivationView.snp.makeConstraints {
      $0.height.equalTo(50)
      $0.width.equalTo(view.frame.width - 64)
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
    }
    inputActivationView.alpha = 0
    
    inputActivationView.delegate = self
    
    UIView.animate(withDuration: 2) {
      self.inputActivationView.alpha = 1
    }
  }
  
  func configureMapView() {
    view.addSubview(mapView)
    mapView.frame = view.frame
    
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
  }
  
  // Mark: - Action
  
}

// MARK: - LocationServices

extension HomeController: CLLocationManagerDelegate {
  func enableLocationServices() {
    locationManager.delegate = self
    
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      print("DEBUG: Not determined..")
      locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied:
      break;
    case .authorizedAlways:
      print("DEBUG: Auth always..")
      locationManager.startUpdatingLocation()
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
    case .authorizedWhenInUse:
      print("DEBUG: Auth when in use..")
      locationManager.requestAlwaysAuthorization()
    @unknown default:
      break
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    
    if status == .authorizedWhenInUse {
      locationManager.requestAlwaysAuthorization()
    }
    
  }
}

extension HomeController: LocationInputActivationViewDelegate {
  func presentLocationInputView() {
    print("DEBUG: Handle present location input view..")
  }
}
