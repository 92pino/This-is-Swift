//
//  ViewController.swift
//  TableviewPassData
//
//  Created by JinBae Jeong on 2020/10/14.
//

import UIKit

class ViewController: UIViewController {
  
  var tasks: [String] = []
  
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Tasks"
    
    tableView.delegate = self
    tableView.dataSource = self
    
    // Setup
    if UserDefaults().bool(forKey: "setup") {
      UserDefaults().set(true, forKey: "setup")
      UserDefaults().set(0, forKey: "count")
    }
    
    // Get all current saved tasks
    updateTasks()
  }
  
  func updateTasks() {
    
    tasks.removeAll()
    
    guard let count = UserDefaults().value(forKey: "count") as? Int else { return }
    
    for x in 0..<count {
      guard let task = UserDefaults().value(forKey: "task_\(x + 1)") as? String else { return }
      tasks.append(task)
    }
    
    tableView.reloadData()
  }

  @IBAction func didTapAdd() {
    
    let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
    vc.title = "New Task"
    vc.update = {
      DispatchQueue.main.async {
        self.updateTasks()
      }
    }
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = tasks[indexPath.row]
    
    return cell
  }
}
