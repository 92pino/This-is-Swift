//
//  ViewController.swift
//  MyMovieChart-SpinOff
//
//  Created by JinBae Jeong on 2020/11/16.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

// MARK: - TableView Delegate

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    NSLog("\(indexPath.row)번째 데이터가 클릭됨")
  }
}

// MARK: - TableView Datasource
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
    cell.textLabel?.text = "\(indexPath.row)번째 데이터입니다."
    
    return cell
  }
}
