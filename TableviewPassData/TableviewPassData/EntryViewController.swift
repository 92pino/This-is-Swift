//
//  ListViewController.swift
//  TableviewPassData
//
//  Created by JinBae Jeong on 2020/10/14.
//

import UIKit

class EntryViewController: UIViewController {
  
  @IBOutlet var field: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    field.delegate = self
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
  }
  
  @objc func saveTask() {
    
    guard let text = field.text, !text.isEmpty else {
      return
    }
    
    
    
  }
}

// MARK: - EntryViewController

extension EntryViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    saveTask()
    
    return true
  }
}
