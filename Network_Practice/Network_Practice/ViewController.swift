//
//  ViewController.swift
//  Network_Practice
//
//  Created by JinBae Jeong on 2020/08/26.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private var serviceData: [Course]? {
    willSet {
      guard let info = newValue else { return }
    }
  }
  
  private let tableView: UITableView = {
    let tb = UITableView()
    
    return tb
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchCourseJSON()
    
    DispatchQueue.main.async {
      print(self.serviceData)
    }
  }
  
  private func fetchCourseJSON() {
    
    DataManager.shared.service.fetchCourseData { result in
      switch result {
      case .success(let courses):
        self.serviceData = courses
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
    
  }


}

