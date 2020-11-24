//
//  ViewController.swift
//  Chapter03-NavigationBar
//
//  Created by JinBae Jeong on 2020/11/23.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
//    self.initTitle()
    self.initNewTitle()
  }
  
  func initNewTitle() {
    let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
    let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 10))
    topTitle.numberOfLines = 1
    topTitle.textAlignment = .center
    topTitle.font = UIFont.systemFont(ofSize: 15)
    topTitle.textColor = .white
    topTitle.text = "58개 숙소"
    
    let subTitle = UILabel(frame: CGRect(x: 0, y: 10, width: 200, height: 10))
    subTitle.numberOfLines = 1
    topTitle.textAlignment = .center
    topTitle.font = UIFont.systemFont(ofSize: 12)
    topTitle.textColor = .white
    topTitle.text = "1박(1월 10일 ~ 1월 11일)"
    
    containerView.addSubview(topTitle)
    containerView.addSubview(subTitle)
    
    self.navigationItem.titleView = containerView
    
    let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1)
    navigationController?.navigationBar.barTintColor = color
  }
  
  func initTitle() {
    let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    nTitle.numberOfLines = 2
    nTitle.textAlignment = .center
    nTitle.textColor = .white
    nTitle.font = UIFont.systemFont(ofSize: 15)
    nTitle.text = "58개 숙소 \n 1박(1월 10일 ~ 1월 11일)"
    
    let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1)
    navigationController?.navigationBar.barTintColor = color
    self.navigationItem.titleView = nTitle
  }


}

