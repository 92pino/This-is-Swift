//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by JinBae Jeong on 2020/11/05.
//

import UIKit

class ResultViewController: UIViewController {

  @IBOutlet weak var resultEmail: UILabel!
  @IBOutlet weak var resultUpdate: UILabel!
  @IBOutlet weak var resultInterval: UILabel!
  
  var paramEmail: String = ""
  var paramUpdate: Bool = false
  var paramInterval: Double = 0
  
  override func viewDidLoad() {
        super.viewDidLoad()

    resultEmail.text = paramEmail
    resultUpdate.text = !paramUpdate ? "자동갱신안함" : "자동갱신"
    resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
    }

  @IBAction func onPressBack(_ sender: UIButton) {
    dismiss(animated: true)
  }
  
}
