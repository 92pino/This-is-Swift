//
//  LocationInputActivationView.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/27.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

protocol LocationInputActivationViewDelegate: class {
  func presentLocationInputView()
}

class LocationInputActivationView: UIView {

  // Mark: - Properties
  
  weak var delegate: LocationInputActivationViewDelegate?
  
  private let indicatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .black
    
    return view
  }()
  
  private let placeholderLabel: UILabel = {
    let label = UILabel()
    label.text = "Where to?"
    label.font = UIFont.systemFont(ofSize: 18)
    label.textColor = .darkGray
    
    return label
  }()
  
  // Mark: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    addShadow()
    
    [indicatorView, placeholderLabel].forEach { addSubview($0) }
    indicatorView.snp.makeConstraints {
      $0.centerY.equalTo(self.snp.centerY)
      $0.left.equalTo(self.snp.left).offset(16)
      $0.width.height.equalTo(6)
    }
    
    placeholderLabel.snp.makeConstraints {
      $0.centerY.equalTo(self.snp.centerY)
      $0.left.equalTo(indicatorView.snp.right).offset(20)
    }
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(presentLocationInputView))
    addGestureRecognizer(tap)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // Mark: - Selectors
  @objc func presentLocationInputView(_ sender: UIView) {
    delegate?.presentLocationInputView()
  }
}
