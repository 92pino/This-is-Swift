//
//  ViewController.swift
//  Chapter02-inputForm
//
//  Created by JinBae Jeong on 2020/11/22.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var paramUpdate: UISwitch!
  @IBOutlet var paramEmail: UITextField!
  @IBOutlet var paramInterval: UIStepper!
  @IBOutlet var txtUpdate: UILabel!
  @IBOutlet var txtIntervalValue: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    paramEmail.autocapitalizationType = .none
  }

  @IBAction func presentUpdateValue(_ sender: UISwitch) {
    txtUpdate.text = sender.isOn == true ? "갱신함" : "갱신하지 않음"
  }
  
  @IBAction func presentIntervalValue(_ sender: UIStepper) {
    txtIntervalValue.text = "\(Int(sender.value))분마다"
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let rvc = segue.destination as? ReadViewController else { return }
    
    rvc.pEmail = paramEmail.text
    rvc.pUpdate = paramUpdate.isOn
    rvc.pInterval = paramInterval.value
  }
  
  @IBAction func submit(_ sender: UIBarButtonItem) {
//    let rvc = ReadViewController()
    
    print(paramUpdate, paramEmail, paramInterval)
    
    
//    navigationController?.pushViewController(rvc, animated: true)
  }
}

