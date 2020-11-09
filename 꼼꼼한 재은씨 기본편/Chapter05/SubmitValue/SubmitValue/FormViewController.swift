//
//  FormViewController.swift
//  SubmitValue
//
//  Created by JinBae Jeong on 2020/11/05.
//

import UIKit

class FormViewController: UIViewController {

  @IBOutlet weak var email: UITextField!
  @IBOutlet weak var isUpdate: UISwitch!
  @IBOutlet weak var interval: UIStepper!
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  @IBAction func onSubmit(_ sender: UIButton) {
//    let ad = UIApplication.shared.delegate as? AppDelegate
//
//    ad?.paramEmail = self.email.text
//    ad?.paramUpdate = self.isUpdate.isOn
//    ad?.paramInterval = self.interval.value
//
//    self.presentingViewController?.dismiss(animated: true)
    
    let userDefaults = UserDefaults.standard
    
    userDefaults.set(self.email.text, forKey: "email")
  }

}
