//
//  CSButton.swift
//  Chapter03-CSButton
//
//  Created by JinBae Jeong on 2020/11/23.
//

import UIKit

public enum CSButtonType {
  case rect
  case circle
}

class CSButton: UIButton {
  required init?(coder: NSCoder) {
    super.init(coder: coder)!
    
    backgroundColor = .green
    layer.borderWidth = 2
    layer.borderColor = UIColor.black.cgColor
    setTitle("버튼", for: .normal)
  }
  
  convenience init(type: CSButtonType) {
    self.init()
    switch type {
    case .rect:
      self.backgroundColor = .black
      layer.borderWidth = 2
      layer.borderColor = UIColor.black.cgColor
      layer.cornerRadius = 0
      setTitle("Rect Button", for: .normal)
      setTitleColor(.white, for: .normal)
    case .circle:
      backgroundColor = .red
    }
  }
}
