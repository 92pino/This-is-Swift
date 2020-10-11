//
//  ViewController.swift
//  UserDefaults_Demo
//
//  Created by JinBae Jeong on 2020/10/07.
//

import UIKit

class ViewController: UIViewController {
  
  let defaults = UserDefaults.standard
  
  private let table: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.register(UserTableCell.self, forCellReuseIdentifier: "userCell")
    
    return table
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    table.delegate = self
    table.dataSource = self
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addUserAction))
    
    configureUI()
    configureAutoLayout()
    loadData()
    
    for (key, value) in defaults.dictionaryRepresentation() {
      print("\(key), \(value)")
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    print("@@@@ :", defaults.object(forKey: "UserName"))
  }
  
  private func configureUI() {
    [table].forEach { view.addSubview($0) }
  }
  
  private func configureAutoLayout() {
    let guide = view.safeAreaLayoutGuide
    NSLayoutConstraint.activate([
      table.topAnchor.constraint(equalTo: guide.topAnchor),
      table.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      table.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      table.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
    ])
  }
  
  private func loadData() {
    if let userData = defaults.object(forKey: "UserName") as? Data {
      let decoder = JSONDecoder()
      if let loadUserData = try? decoder.decode(User.self, from: userData) {
        print(loadUserData)
      }
    }
  }
  
  @objc func addUserAction(_ sender: UIButton) {
    let controller = DetailViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserTableCell else { return UITableViewCell() }
    
    cell.configure(title: "test")
    
    return cell
  }
}
