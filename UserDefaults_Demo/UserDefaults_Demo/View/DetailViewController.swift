//
//  DetailViewController.swift
//  UserDefaults_Demo
//
//  Created by JinBae Jeong on 2020/10/07.
//

import UIKit

class DetailViewController: UIViewController {
  
  let defaults = UserDefaults.standard
  
  private let nameTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.borderStyle = .line
    
    return tf
  }()
  
  private let addButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Add", for: .normal)
    button.addTarget(self, action: #selector(addAction), for: .touchUpInside)
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    configureUI()
  }
  
  private func configureUI() {
    [nameTextField, addButton].forEach { view.addSubview($0) }
    
    NSLayoutConstraint.activate([
      nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      nameTextField.widthAnchor.constraint(equalToConstant: 150),
      addButton.centerXAnchor.constraint(equalTo: nameTextField.centerXAnchor),
      addButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
    ])
  }
  
  @objc func addAction(_ sender: UIButton) {
    guard let name = nameTextField.text else { return }
    let encoder = JSONEncoder()
    
    if let jsonData = try? encoder.encode(User(name: name)) {
      defaults.set(jsonData, forKey: "UserName")
    }
    defaults.synchronize()
    navigationController?.popViewController(animated: true)
  }
  
}
