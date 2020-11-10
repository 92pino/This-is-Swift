//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by JinBae Jeong on 2020/11/10.
//

import UIKit

class ListViewController: UITableViewController {
  
  var dataset = [
    ("다크 나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-09", 8.95, "darknight.jpg"),
    ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31, "rain.jpg"),
    ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19, "secret.jpg"),
  ]
  
  lazy var list: [MovieVO] = {
    var datalist = [MovieVO]()
    for (title, description, opendate, rating, thumbnail) in dataset {
      let mvo = MovieVO()
      mvo.title = title
      mvo.description = description
      mvo.opendate = opendate
      mvo.rating = rating
      mvo.thumbnail = thumbnail
      
      datalist.append(mvo)
    }
    
    return datalist
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Table view data source
  
  // 행의 개수 반환
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }
  
  // 각 행이 화면에 표현해야 할 내용을 구성하는데 사용
  // 반환값은 개별적인 테이블 셀 객체
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = list[indexPath.row]
    // dequeueReusableCell : 한차례 사용된 테이블 셀 인스턴스가 폐기되지 않고 재사용을 위해 대기하는 공간
    // 입력된 아이디에 맞는 인스턴스가 큐에 있다면 재사용, 없으면 새로 생성하여 제공하는 방식으로 동작
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? MovieCell else { return UITableViewCell() }
    
    let title = cell.viewWithTag(101) as? UILabel
    let desc = cell.viewWithTag(102) as? UILabel
    let opendate = cell.viewWithTag(103) as? UILabel
    let rating = cell.viewWithTag(104) as? UILabel
    
    cell.title?.text = row.title
    cell.desc?.text = row.description
    cell.opendate?.text = row.opendate
    cell.rating?.text = "\(row.rating!)"
    cell.thumbnail.image = UIImage(named: row.thumbnail!)
    
    return cell
  }
  
  // MARK: - Table view Delegate
  // 특정 행을 선택 했을 때 호출
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
  }
  
  // 특정 행의 높이를 설정하고 싶을 경우 사용
  // 만약 이 메서드가 설정되면 rowHeight는 실행 안됨
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 0
  }
  
}
