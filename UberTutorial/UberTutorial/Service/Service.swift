//
//  Service.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/24.
//  Copyright © 2020 pino. All rights reserved.
//

import Firebase

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")

struct Service {
  static let shared = Service()
  let currentUid = Auth.auth().currentUser?.uid
  
  func fetchUserData(completion: @escaping(User) -> Void) {
    REF_USERS.child(currentUid!).observeSingleEvent(of: .value) { (snapshot) in
      guard let dictionary = snapshot.value as? [String: Any] else { return }
      print("@@@@ :", dictionary)
      let user = User(dictionary: dictionary)
      completion(user)
    }
  }
}
