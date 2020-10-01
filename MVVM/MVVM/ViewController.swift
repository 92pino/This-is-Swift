//
//  ViewController.swift
//  MVVM
//
//  Created by JinBae Jeong on 2020/09/30.
//

import UIKit

let identifier = "todoItemCellIdentifier"

class ViewController: UIViewController {
  
  @IBOutlet weak var tableViewItems: UITableView!
  @IBOutlet weak var textFieldNewItem: UITextField!
  
  var viewModel: TodoViewModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableViewItems.delegate = self
    tableViewItems.dataSource = self
    
    let nib = UINib(nibName: "TodoItemTableViewCell", bundle: nil)
    tableViewItems.register(nib, forCellReuseIdentifier: identifier)
    
    viewModel = TodoViewModel()
  }
  
  @IBAction func onAddItem(_ sender: UIButton) {
    
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (viewModel?.items.count)!
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? TodoItemTableViewCell else { return UITableViewCell() }
    
    let itemViewModel = viewModel?.items[indexPath.row]
    cell.configure(withViewModel: itemViewModel!)
    
    return cell
  }
  
  
}
