//
//  LocationInputActivationView.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/24.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import SnapKit

protocol LocationInputActivationViewDelegate: class {
  func presentLocationInputView()
}

class LocationInputActivationView: UIView {
  
  weak var delegate: LocationInputActivationViewDelegate?

  // Mark: - Properties
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
    
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.55
    layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
    layer.masksToBounds = false
    
    [indicatorView, placeholderLabel].forEach{ addSubview($0) }
    indicatorView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16)
    indicatorView.snp.makeConstraints {
      $0.width.equalTo(6)
      $0.height.equalTo(6)
    }
    
    placeholderLabel.centerY(inView: self, leftAnchor: indicatorView.rightAnchor, paddingLeft: 20)
    
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
