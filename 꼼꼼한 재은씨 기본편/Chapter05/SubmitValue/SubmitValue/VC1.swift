//
//  VC1.swift
//  SubmitValue
//
//  Created by JinBae Jeong on 2020/11/05.
//

import UIKit

class VC1: UIViewController {

  @IBOutlet weak var resultEmail: UILabel!
  @IBOutlet weak var resultUpdate: UILabel!
  @IBOutlet weak var resultInterval: UILabel!
  
  var paramEmail: String?
  var paramUpdate: Bool?
  var paramInterval: Double?
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if let email = paramEmail {
      resultEmail.text = email
    }
    
    if let update = paramUpdate {
      resultUpdate.text = !update ? "자동갱신 안함" : "자동갱신"
    }
    
    if let interval = paramInterval {
      resultInterval.text = "\(Int(interval))분마다"
    }
  }
    

}
