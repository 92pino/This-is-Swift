//
//  FrontViewController.swift
//  Chapter04-SideBar
//
//  Created by JinBae Jeong on 2020/11/24.
//

import UIKit

class FrontViewController: UIViewController {
  
  @IBOutlet var sideBarButton: UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let revealVC = revealViewController() {
      self.sideBarButton.target = revealVC
      self.sideBarButton.action = #selector(revealVC.revealToggle(_:))
      
      self.view.addGestureRecognizer(revealVC.panGestureRecognizer())
    }
  }
  
}
