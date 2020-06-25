//
//  LocationHandler.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/26.
//  Copyright © 2020 pino. All rights reserved.
//

import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate {
  
  static let shared = LocationHandler()
  
  var locationManager: CLLocationManager!
  var location: CLLocation?
  
  override init() {
    super.init()
    
    locationManager = CLLocationManager()
    locationManager.delegate = self
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    
    if status == .authorizedWhenInUse {
      locationManager.requestAlwaysAuthorization()
    }
    
  }
  
}
