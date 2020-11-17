//
//  ViewController.swift
//  BreakPoint-Test
//
//  Created by JinBae Jeong on 2020/11/18.
//

import UIKit

class ViewController: UIViewController {
  
  var sum = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    
    var count = 0
    
    for row in 5...10 {
      count += 1
      self.sum += row
    }
    
    print("총 합은 \(self.sum), \(count)회 실행되었습니다.")
  }


}

