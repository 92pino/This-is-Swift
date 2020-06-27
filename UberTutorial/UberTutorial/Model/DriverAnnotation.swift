//
//  DriverAnnotation.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/27.
//  Copyright © 2020 pino. All rights reserved.
//

import MapKit

class DriverAnnotation: NSObject, MKAnnotation {
  var coordinate: CLLocationCoordinate2D
  var uid: String
  
  init(uid: String, coordinate: CLLocationCoordinate2D) {
    self.uid = uid
    self.coordinate = coordinate
  }
  
}
