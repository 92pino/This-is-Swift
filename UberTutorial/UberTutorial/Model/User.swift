//
//  User.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/24.
//  Copyright © 2020 pino. All rights reserved.
//

import CoreLocation

struct User {
  let fullname: String
  let email: String
  let accountType: Int
  var location: CLLocation?
  
  init(dictionary: [String: Any]) {
    self.fullname = dictionary["fullname"] as? String ?? ""
    self.email = dictionary["email"] as? String ?? ""
    self.accountType = dictionary["accountType"] as? Int ?? 0
  }
}
