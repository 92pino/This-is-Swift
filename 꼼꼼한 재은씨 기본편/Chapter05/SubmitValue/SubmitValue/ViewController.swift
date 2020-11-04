//
//  ViewController.swift
//  SubmitValue
//
//  Created by JinBae Jeong on 2020/11/05.
//

import UIKit

class ViewController: UIViewController {

  // 이메일 주소를 입력받는 텍스트필드
  @IBOutlet weak var email: UITextField!
  // 자동 갱신 여부를 설정하는 스위치
  @IBOutlet weak var isUpdate: UISwitch!
  // 갱신 주기를 설정하는 스태퍼
  @IBOutlet weak var interval: UIStepper!
  // 자동갱신 여부를 표시하는 레이블
  @IBOutlet weak var isUpdateText: UILabel!
  // 갱신주기를 텍스트로 표시하는 레이블
  @IBOutlet weak var intervalText: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print(1111)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    print(2222)
  }
  
  @IBAction func onSwitch(_ sender: UISwitch) {
    if sender.isOn == true {
      self.isUpdateText.text = "갱신함"
    } else {
      self.isUpdateText.text = "갱신하지 않음"
    }
  }
  
  @IBAction func onStepper(_ sender: UIStepper) {
    let value = Int(sender.value)
    intervalText.text = "\(value)분 마다"
  }
  
  @IBAction func naviOnSubmit(_ sender: UIBarButtonItem) {
    guard let vc = storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else { return }
    
    vc.paramEmail = email.text!
    vc.paramUpdate = isUpdate.isOn
    vc.paramInterval = interval.value
    
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @IBAction func onSubmit(_ sender: UIButton) {
    guard let vc = storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else { return }
    vc.paramEmail = email.text!
    vc.paramUpdate = isUpdate.isOn
    vc.paramInterval = interval.value
    
    present(vc, animated: true)
  }
  
}

