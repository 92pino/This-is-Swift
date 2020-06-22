//
//  AuthButton.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/22.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class AuthButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setTitle("Log In", for: .normal)
    setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
    backgroundColor = .mainBlueTint
    layer.cornerRadius = 5
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
