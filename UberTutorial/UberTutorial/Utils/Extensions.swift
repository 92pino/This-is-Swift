//
//  Extensions.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/27.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import MapKit

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
    view.addSubview(imageView)
    imageView.image = image
    imageView.alpha = 0.87
    
    if let textField = textField {
      [textField].forEach{ view.addSubview($0) }
      
      textField.snp.makeConstraints {
        $0.left.equalTo(imageView.snp.right).offset(8)
        $0.centerY.equalTo(view.snp.centerY)
      }
      
      imageView.snp.makeConstraints {
        $0.centerY.equalTo(view.snp.centerY)
        $0.left.equalTo(view.snp.left).offset(8)
        $0.height.equalTo(24)
        $0.width.equalTo(24)
      }
    }
    
    if let sc = segmentedControl {
      imageView.snp.makeConstraints {
        $0.left.equalTo(view.snp.left).offset(8)
        $0.top.equalTo(view.snp.top).offset(-8)
        $0.height.equalTo(24)
        $0.width.equalTo(24)
      }
      
      [sc].forEach { view.addSubview($0) }
      
      sc.snp.makeConstraints {
        $0.left.equalTo(view.snp.left).offset(8)
        $0.right.equalTo(view.snp.right).offset(-8)
        $0.centerY.equalTo(view.snp.centerY).offset(8)
      }
    }
    
    let separatorView = UIView()
    separatorView.backgroundColor = .lightGray
    view.addSubview(separatorView)
    separatorView.snp.makeConstraints {
      $0.left.equalTo(view.snp.left).offset(8)
      $0.bottom.equalTo(view.snp.bottom)
      $0.right.equalTo(view.snp.right)
      $0.height.equalTo(0.75)
    }
    
    return view
  }
  
  func addShadow() {
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.45
    layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
    layer.masksToBounds = false
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

extension MKPlacemark {
  var address: String? {
    get {
      // 상세 주소
      guard let subThoroughfare = subThoroughfare else { return nil }
      // 리 이름
      guard let throughfare = thoroughfare else { return nil }
      // 시 이름
      guard let locality = locality else { return nil }
      // 도 이름
      guard let adminArea = administrativeArea else { return nil }
      
      return "\(subThoroughfare) \(throughfare), \(locality), \(adminArea)"
    }
  }
}
