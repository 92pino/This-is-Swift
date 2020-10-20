//
//  ViewController.swift
//  Singleton_Pattern
//
//  Created by JinBae Jeong on 2020/10/20.
//

import UIKit

class ViewController: UIViewController {
  
  let normal = NormalClass.shared
  let normal2 = NormalClass.shared

  override func viewDidLoad() {
    super.viewDidLoad()
    
    print(normal.x, normal2.x)
    // 이미 normal 싱글톤 객체가 먼저 생겨서 그 인스턴스의 참조값을 전달한다.
    normal2.x = 10
    print(normal.x, normal2.x)
    view.backgroundColor = .red
  }


}

