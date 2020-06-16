//
//  LoginController.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/17.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
  
  // MARK: - Properties
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "UBER"
    label.font = UIFont(name: "Avenir-Light", size: 36)
    label.textColor = UIColor(white: 1, alpha: 0.8)
    
    return label
  }()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    
    [titleLabel].forEach { view.addSubview($0) }
    
    let guide = view.safeAreaLayoutGuide
    
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      titleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0)
    ])
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
}
