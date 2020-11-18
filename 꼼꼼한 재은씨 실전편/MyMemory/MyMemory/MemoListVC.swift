//
//  MemoListVC.swift
//  MyMemory
//
//  Created by JinBae Jeong on 2020/11/18.
//

import UIKit

class MemoListVC: UITableViewController {
  
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  
  // 화면이 로드될 떄 한번만 실행
  // 일반적으로 초기화구문이나 데이터 구성 관련 코드 입력
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // 뷰 컨트롤러가 화면에 표시되기 전에 호출
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    tableView.reloadData()
  }
  
  // 뷰 컨트롤러가 화면에 표시되고 호출
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    return self.appDelegate.memoList.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = appDelegate.memoList[indexPath.row]
    
    let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
    
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
    
    cell.subject?.text = row.title
    cell.contents?.text = row.contents
    cell.img?.image = row.image
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    cell.regdate?.text = formatter.string(from: row.regdate!)
    
    return cell
  }
  
  // MARK: - Table view delegate
  
  // 셀 선택하는 tableView delegate
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let row = appDelegate.memoList[indexPath.row]
    
    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else { return }
    
    vc.param = row
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
