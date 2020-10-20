//
//  ListViewController.swift
//  TableviewPassData
//
//  Created by JinBae Jeong on 2020/10/14.
//

import UIKit

class EntryViewController: UIViewController {
  
  @IBOutlet var field: UITextField!
  
  var update: (() -> ())?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    field.delegate = self
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
  }
  
  @objc func saveTask() {
    print(1111)

    guard let text = field.text, !text.isEmpty else {
      return
    }

    guard let count = UserDefaults().value(forKey: "count") as? Int else { return }

    let newCount = count + 1

    UserDefaults().set(newCount, forKey: "count")

    UserDefaults().set(text, forKey: "task_\(newCount)")
    
    update?()
    
    print(11112)
    
    navigationController?.popViewController(animated: true)
    
  }
}

// MARK: - EntryViewController

extension EntryViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    saveTask()
    
    return true
  }
}
