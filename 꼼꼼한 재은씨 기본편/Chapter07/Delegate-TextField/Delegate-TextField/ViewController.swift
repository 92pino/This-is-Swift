//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by JinBae Jeong on 2020/11/09.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tf: UITextField!
  @IBOutlet weak var toggleSwitch: UISwitch!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tf.placeholder = "값을 입력하세요"
    tf.keyboardType = .alphabet
    tf.keyboardAppearance = .dark
    tf.returnKeyType = .join
    tf.enablesReturnKeyAutomatically = true
    
    tf.borderStyle = .line
    tf.backgroundColor = UIColor(white: 0.87, alpha: 1)
    tf.contentVerticalAlignment = .center
    tf.contentHorizontalAlignment = .center
    tf.layer.borderColor = UIColor.darkGray.cgColor
    tf.layer.borderWidth = 2.0
    
    // 텍스트필드를 최초 응답자로 지정
    tf.becomeFirstResponder()
    
    tf.delegate = self
  }

  @IBAction func confirm(_ sender: UIButton) {
    // 텍스트 필드를 최초 응답자에서 해제
    tf.resignFirstResponder()
  }
  
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    print("텍스트 필드의 편집이 시작됩니다.")
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    print("텍스트 필드의 내용이 \(string)으로 변경됩니다")
    
    if toggleSwitch.isOn {
      if Int(string) == nil {
        if (textField.text?.count)! + string.count > 10 {
          return false
        } else {
          return true
        }
      } else {
        return false
      }
    } else {
      return false
    }
  }
}
