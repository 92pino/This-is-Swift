//
//  HomeController.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/27.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import Firebase
import MapKit

private let reuseIdentifier = "LocationCell"
private let annotationIdentifier = "DriverAnnotation"

class HomeController: UIViewController {
  
  // Mark: - Properties
  private let mapView = MKMapView()
  
  private let locationManager = LocationHandler.shared.locationManager
  
  private let inputActivationView = LocationInputActivationView()
  private let locationInputView = LocationInputView()
  private let tableView = UITableView()
  
  private var user: User? {
    didSet {
      locationInputView.user = user
    }
  }
  
  private final let locationInputViewHeight: CGFloat = 200
  
  // Mark: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    checkIfUserIsLoggedIn()
    enableLocationServices()
  }
  
  // MARK: - API
  
  func fetchUserData() {
    guard let currentUid = Auth.auth().currentUser?.uid else { return }
    Service.shared.fetchUserData(uid: currentUid) { user in
      self.user = user
    }
  }
  
  func fetchDrivers() {
    guard let location = locationManager?.location else { return }
    Service.shared.fetchDrivers(location: location) { driver in
      guard let coordinate = driver.location?.coordinate else { return }
      let annotation = DriverAnnotation(uid: driver.uid, coordinate: coordinate)
      
      var driverIsVisible: Bool {
        return self.mapView.annotations.contains { annotation -> Bool in
          guard let driverAnno = annotation as? DriverAnnotation else { return false }
          if driverAnno.uid == driver.uid {
            driverAnno.updateAnnotationPosition(withCoordinate: coordinate)
            return true
          }
          return false
        }
      }
      
      if !driverIsVisible {
        self.mapView.addAnnotation(annotation)
      }
    }
  }
  
  func checkIfUserIsLoggedIn() {
    if Auth.auth().currentUser?.uid == nil {
      // 로그인 안됐을 경우
      DispatchQueue.main.async {
        let nav = UINavigationController(rootViewController: LoginController())
        self.present(nav, animated: true, completion: nil)
      }
    } else {
      // 로그인 됐을 경우
      configure()
    }
  }
  
  func signOut() {
    do {
      try Auth.auth().signOut()
      DispatchQueue.main.async {
        let nav = UINavigationController(rootViewController: LoginController())
        self.present(nav, animated: true, completion: nil)
      }
    } catch {
      print("DEBUG: Error signing out")
    }
  }
  
  // MARK: - Helper Functions
  
  func configure() {
    configureUI()
    fetchUserData()
    fetchDrivers()
  }
  
  func configureUI() {
    configureMapView()
    
    [inputActivationView].forEach{ view.addSubview($0) }
    inputActivationView.snp.makeConstraints {
      $0.centerX.equalTo(view.snp.centerX)
      $0.width.equalTo(view.frame.width - 64)
      $0.height.equalTo(50)
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
    
    mapView.delegate = self
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
    tableView.tableFooterView = UIView()
    
    let height = view.frame.height - locationInputViewHeight
    tableView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: height)
    
    [tableView].forEach { view.addSubview($0) }
  }
  
  // Mark: - Selectors
  
}

// MARK: - MKMapViewDelegate
extension HomeController: MKMapViewDelegate {
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    if let annotation = annotation as? DriverAnnotation {
      let view = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
      view.image = #imageLiteral(resourceName: "chevron-sign-to-right")
      
      return view
    }
    
    return nil
  }
  
}

// MARK: - LocationServices

extension HomeController {
  func enableLocationServices() {
    
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      print("DEBUG: Not determined..")
      locationManager?.requestWhenInUseAuthorization()
    case .restricted, .denied:
      break
    case .authorizedAlways:
      print("DEBUG: Auth always..")
      locationManager?.startUpdatingLocation()
      locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    case .authorizedWhenInUse:
      print("DEBUG: Auth when in use..")
      locationManager?.requestWhenInUseAuthorization()
    @unknown default:
      break
    }
  }
  
}

// MARK: - LocationInputActivationViewDelegate

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

// MARK: - UITableViewDelegate/UITableViewDataSource

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
