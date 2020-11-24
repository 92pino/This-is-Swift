//
//  ViewController.swift
//  Chapter03-TabBar
//
//  Created by JinBae Jeong on 2020/11/22.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    let tabBar = tabBarController?.tabBar
    UIView.animate(withDuration: TimeInterval(0.15)) {
      tabBar?.alpha = (tabBar?.alpha == 0 ? 1 : 0)
    }
  }

}

