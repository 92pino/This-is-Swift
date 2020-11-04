//
//  SecondNaviViewController.swift
//  Scene-Trans01
//
//  Created by JinBae Jeong on 2020/11/04.
//

import UIKit

class SecondNaviViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  @IBAction func onPressDismiss(_ sender: UIButton) {
    dismiss(animated: true)
  }
  @IBAction func back(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
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
