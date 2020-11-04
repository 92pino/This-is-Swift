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
    let preVC = self.presentingViewController
    print(preVC)
    guard let vc = preVC as? ViewController else { return }
    print(vc)
    
//    vc.paramEmail = self.email.text
  }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
