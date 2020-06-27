//
//  DriverAnnotation.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/27.
//  Copyright © 2020 pino. All rights reserved.
//

import MapKit

class DriverAnnotation: NSObject, MKAnnotation {
  // dynamic으로 선언된 멤버는 Objective-C 런타임을 사용하여 항상 동적으로 디스패치 된다.
  dynamic var coordinate: CLLocationCoordinate2D
  var uid: String
  
  init(uid: String, coordinate: CLLocationCoordinate2D) {
    self.uid = uid
    self.coordinate = coordinate
  }
  
  func updateAnnotationPosition(withCoordinate coordinate: CLLocationCoordinate2D) {
    UIView.animate(withDuration: 0.2) {
      self.coordinate = coordinate
    }
  }
  
}
