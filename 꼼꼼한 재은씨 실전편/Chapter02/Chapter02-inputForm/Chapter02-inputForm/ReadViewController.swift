//
//  ReadViewController.swift
//  Chapter02-inputForm
//
//  Created by JinBae Jeong on 2020/11/22.
//

import UIKit

class ReadViewController: UIViewController {
  
  var pEmail: String?
  var pUpdate: Bool?
  var pInterval: Double?
  
  @IBOutlet var email: UILabel!
  @IBOutlet var update: UILabel!
  @IBOutlet var interval: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    email?.text = "전달받은 이메일 : \(self.pEmail!)"
    update?.text = "업데이트 여부 : \(self.pUpdate == true ? "업데이트 함" : "업데이트 안 함")"
    interval?.text = "업데이트 주기 : \(self.pInterval!)분마다"
    
  }
  
}
