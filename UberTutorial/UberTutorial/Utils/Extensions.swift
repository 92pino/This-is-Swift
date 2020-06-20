//
//  Extensions.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/20.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import SnapKit

extension UIColor {
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }
  
  static let backgroundColor = UIColor.rgb(red: 25, green: 25, blue: 25)
  static let mainBlueTint = UIColor.rgb(red: 17, green: 154, blue: 237)
}

extension UIView {
  func inputContainerView(image: UIImage, textField: UITextField? = nil, segmentedControl: UISegmentedControl? = nil) -> UIView {
    let view = UIView()
    
    let imageView = UIImageView()
    imageView.image = image
    imageView.alpha = 0.87
    
    let seperatorView = UIView()
    seperatorView.backgroundColor = .lightGray
    
    if let textField = textField {
      [imageView, textField, seperatorView].forEach {
        view.addSubview($0) }
      
      imageView.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.left.equalToSuperview().offset(8)
        $0.width.height.equalTo(24)
      }
      
      textField.snp.makeConstraints {
        $0.left.equalTo(imageView.snp.right).offset(8)
        $0.right.equalToSuperview()
        $0.centerY.equalToSuperview()
        $0.bottom.equalToSuperview().offset(-8)
      }
      
      seperatorView.snp.makeConstraints {
        $0.bottom.right.equalToSuperview()
        $0.left.equalToSuperview().offset(8)
        $0.height.equalTo(0.75)
      }
    }
    
    if let sc = segmentedControl {
      
      view.addSubview(sc)
      
      imageView.snp.makeConstraints {
        $0.top.equalTo(view.snp.top).offset(-8)
        $0.left.equalTo(view.snp.left).offset(8)
        $0.width.equalTo(24)
        $0.height.equalTo(24)
      }
      
      sc.snp.makeConstraints {
        $0.left.equalTo(view.snp.left).offset(8)
        $0.right.equalTo(view.snp.right).offset(-8)
        $0.centerY.equalTo(view.snp.centerY).offset(8)
      }
    }
    
    return view
  }
}

extension UITextField {
  func textField(withPlaceholder placeholder: String, isSecureTextEntry: Bool) -> UITextField {
    let tf = UITextField()
    tf.borderStyle = .none
    tf.font = UIFont.systemFont(ofSize: 16)
    tf.textColor = .white
    tf.keyboardAppearance = .dark
    tf.isSecureTextEntry = isSecureTextEntry
    tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
    
    return tf
  }
}
