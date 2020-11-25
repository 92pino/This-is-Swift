//
//  SideBarViewController.swift
//  Chapter04-SideBarDIY
//
//  Created by JinBae Jeong on 2020/11/24.
//

import UIKit

class SideBarViewController: UITableViewController {
  
  let titles = [
    "메뉴 01",
    "메뉴 02",
    "메뉴 03",
    "메뉴 04",
    "메뉴 05"
  ]
  
  let icons = [
    UIImage(named: "icon01.png"),
    UIImage(named: "icon02.png"),
    UIImage(named: "icon03.png"),
    UIImage(named: "icon04.png"),
    UIImage(named: "icon05.png")
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 0
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return self.titles.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let id = "menucell"
    var cell = tableView.dequeueReusableCell(withIdentifier: id)
    
    if cell == nil {
      cell = UITableViewCell(style: .default, reuseIdentifier: id)
    }
    
    cell?.textLabel?.text = titles[indexPath.row]
    cell?.imageView?.image = icons[indexPath.row]
    cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
    
    return cell!
  }
  
}
