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
import SnapKit

private let reuseIdentifier = "LocationCell"

class HomeController: UIViewController {
  
  // Mark: - Properties
  private let mapView = MKMapView()
  private let locationManager = CLLocationManager()
  private let locationInputView = LocationInputView()
  
  private let inputActivationView = LocationInputActivationView()
  
  private let tableView = UITableView()
  
  private final let locationInputViewHeight: CGFloat = 200
  
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
    
    configureTableView()
  }
  
  func configureMapView() {
    view.addSubview(mapView)
    mapView.frame = view.frame
    
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
  }
  
  func configureLocationInputView() {
    locationInputView.delegate = self
    [locationInputView].forEach { view.addSubview($0) }
    locationInputView.snp.makeConstraints {
      $0.top.equalTo(view.snp.top)
      $0.left.equalTo(view.snp.left)
      $0.right.equalTo(view.snp.right)
      $0.height.equalTo(locationInputViewHeight)
    }
    locationInputView.alpha = 0
    
    UIView.animate(withDuration: 0.5, animations: {
      self.locationInputView.alpha = 1
    }) { _ in
      UIView.animate(withDuration: 0.3) {
        self.tableView.frame.origin.y = self.locationInputViewHeight
      }
    }
  }
  
  func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(LocationCell.self, forCellReuseIdentifier: reuseIdentifier)
    tableView.rowHeight = 60
    // 테이블 하단에 빈 공간 추가하기
    tableView.tableFooterView = UIView()
    
    let height = view.frame.height - locationInputViewHeight
    tableView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: height)
    
    view.addSubview(tableView)
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
    inputActivationView.alpha = 0
    configureLocationInputView()
    
  }
}

extension HomeController: LocationInputViewDelegate {
  func dismissLocationInputView() {
    UIView.animate(withDuration: 0.3, animations: {
      self.locationInputView.alpha = 0
      self.tableView.frame.origin.y = self.view.frame.height
    }) { _ in
      self.locationInputView.removeFromSuperview()
      UIView.animate(withDuration: 0.3) {
        self.inputActivationView.alpha = 1
      }
    }
  }
}

// MARK: - UITableViewDelegate/DataSource

extension HomeController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Test"
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? 2 : 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? LocationCell else { return UITableViewCell() }
    
    return cell
  }
}
