//
//  ViewController.swift
//  Chapter02-Button
//
//  Created by JinBae Jeong on 2020/11/22.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let btn = UIButton(type: .system)
    btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
    btn.setTitle("테스트 버튼", for: .normal)
    
    btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
    
    btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
    
    self.view.addSubview(btn)
  }
  
  @objc func btnOnClick(_ sender: UIButton) {
    sender.setTitle("클릭되었습니다", for: .normal)
  }


}

