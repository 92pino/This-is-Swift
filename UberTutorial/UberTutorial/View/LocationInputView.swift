//
//  LocationInputView.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/27.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

protocol LocationInputViewDelegate: class {
  func dismissLocationInputView()
  func executeSearch(query: String)
}

class LocationInputView: UIView {

  // Mark: - Properties
  
  var user: User? {
    didSet {
      titleLabel.text = user?.fullname
    }
  }
  
  weak var delegate: LocationInputViewDelegate?
  
  private let backButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_black_36dp-1").withRenderingMode(.alwaysOriginal), for: .normal)
    button.addTarget(self, action: #selector(handleBackTapped), for: .touchUpInside)
    
    return button
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 16)
    
    return label
  }()
  
  private let startLocationIndicatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    view.layer.cornerRadius = 6 / 2
    
    return view
  }()
  
  private let linkingView: UIView = {
    let view = UIView()
    view.backgroundColor = .darkGray
    
    return view
  }()
  
  private let destinationIndicatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .black
    
    return view
  }()
  
  private lazy var startingLocationTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "Current Location"
    tf.backgroundColor = .systemGroupedBackground
    tf.isEnabled = false
    tf.font = UIFont.systemFont(ofSize: 14)
    
    let paddingView = UIView()
    paddingView.snp.makeConstraints {
      $0.width.equalTo(8)
      $0.height.equalTo(30)
    }
    tf.leftView = paddingView
    tf.leftViewMode = .always
    
    return tf
  }()
  
  private lazy var destinationLocationTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "Enter a destination"
    tf.backgroundColor = .lightGray
    tf.returnKeyType = .search
    tf.font = UIFont.systemFont(ofSize: 14)
    tf.delegate = self
    
    let paddingView = UIView()
    paddingView.snp.makeConstraints {
      $0.width.equalTo(8)
      $0.height.equalTo(30)
    }
    tf.leftView = paddingView
    tf.leftViewMode = .always
    
    return tf
  }()
  
  // Mark: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addShadow()
    
    backgroundColor = .white
    
    [backButton, titleLabel, startLocationIndicatorView, linkingView, destinationIndicatorView, startingLocationTextField, destinationLocationTextField].forEach { addSubview($0) }
    backButton.snp.makeConstraints {
      $0.top.equalTo(self.snp.top).offset(44)
      $0.left.equalTo(self.snp.left).offset(12)
      $0.width.equalTo(24)
      $0.height.equalTo(25)
    }
    
    titleLabel.snp.makeConstraints {
      $0.centerY.equalTo(backButton.snp.centerY)
      $0.centerX.equalTo(self.snp.centerX)
    }
    
    startingLocationTextField.snp.makeConstraints {
      $0.top.equalTo(backButton.snp.bottom).offset(4)
      $0.left.equalTo(self.snp.left).offset(40)
      $0.right.equalTo(self.snp.right).offset(-40)
      $0.height.equalTo(30)
    }
    
    destinationLocationTextField.snp.makeConstraints {
      $0.top.equalTo(startingLocationTextField.snp.bottom).offset(12)
      $0.left.equalTo(self.snp.left).offset(40)
      $0.right.equalTo(startingLocationTextField.snp.right)
      $0.height.equalTo(30)
    }
    
    startLocationIndicatorView.snp.makeConstraints {
      $0.centerX.equalTo(backButton.snp.centerX)
      $0.centerY.equalTo(startingLocationTextField.snp.centerY)
      $0.width.height.equalTo(6)
    }
    
    linkingView.snp.makeConstraints {
      $0.centerX.equalTo(backButton.snp.centerX)
      $0.top.equalTo(startLocationIndicatorView.snp.bottom).offset(4)
      $0.bottom.equalTo(destinationIndicatorView.snp.top).offset(-4)
      $0.width.equalTo(0.5)
    }
    
    destinationIndicatorView.snp.makeConstraints {
      $0.centerX.equalTo(backButton.snp.centerX)
      $0.centerY.equalTo(destinationLocationTextField.snp.centerY)
      $0.width.height.equalTo(6)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // Mark: - Selectors
  @objc func handleBackTapped(_ sender: UIButton) {
    delegate?.dismissLocationInputView()
  }
}

// MARK: - UITextFieldDelegate
extension LocationInputView: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard let query = textField.text else { return false }
    delegate?.executeSearch(query: query)
    
    return true
  }
}
