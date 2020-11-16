//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by JinBae Jeong on 2020/11/10.
//

import UIKit

class ListViewController: UITableViewController {
  
  // 현재까지 읽어온 데이터의 페이지 정보
  var page = 1
  
  lazy var list: [MovieVO] = {
    var datalist = [MovieVO]()
    return datalist
  }()
  
  @IBOutlet weak var more: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    callMovieAPI()
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
    
    NSLog("제목 : \(row.title!), 호출된 행번호: \(indexPath.row)")
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
    
    DispatchQueue.main.async {
      cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
    }
    
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
  
  func callMovieAPI() {
    let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
    let apiURI: URL! = URL(string: url)
    
    let apidata = try! Data(contentsOf: apiURI)
    
    let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "데이터가 없습니다"
    
    NSLog("API Result=\(log)")
    
    do {
      let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
      
      let hoppin = apiDictionary["hoppin"] as! NSDictionary
      let movies = hoppin["movies"] as! NSDictionary
      let movie = movies["movie"] as! NSArray
      
      for row in movie {
        let r = row as! NSDictionary
        
        let mvo = MovieVO()
        
        mvo.title = r["title"] as? String
        mvo.description = r["genreNames"] as? String
        mvo.thumbnail = r["thumbnailImage"] as? String
        mvo.detail = r["linkUrl"] as? String
        mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
        
        let url: URL! = URL(string: mvo.thumbnail!)
        let imageData = try! Data(contentsOf: url)
        mvo.thumbnailImage = UIImage(data: imageData)
        
        self.list.append(mvo)
        
        let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
        print("@@@@@ :", totalCount)
        
        if (self.list.count >= totalCount) {
          self.more.isHidden = true
        }
      }
    } catch {
      NSLog("Parse Error!!")
    }
  }
  
  func getThumbnailImage(_ index: Int) -> UIImage {
    let mvo = self.list[index]
    
    if let savedImage = mvo.thumbnailImage {
      return savedImage
    } else {
      let url: URL! = URL(string: mvo.thumbnail!)
      let imageData = try! Data(contentsOf: url)
      mvo.thumbnailImage = UIImage(data: imageData)
      
      return mvo.thumbnailImage!
    }
  }
  
  @IBAction func add(_ sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "영화 입력", message: "추가될 영화 내역을 작성해주세요", preferredStyle: .alert)
    alert.addTextField { (tf) in
      tf.placeholder = "영화 제목을 입력해주세요"
    }
    alert.addTextField { (tf) in
      tf.placeholder = "영화에 대한 설명을 입력해주세요"
    }
    alert.addTextField { (tf) in
      tf.placeholder = "개봉일을 입력해주세요"
    }
    alert.addTextField { (tf) in
      tf.placeholder = "평점을 입력해주세요"
    }
    
    let ok = UIAlertAction(title: "OK", style: .default) { _ in
      guard let title = alert.textFields?[0].text else { return }
      guard let desc = alert.textFields?[1].text else { return }
      guard let opendate = alert.textFields?[2].text else { return }
      guard let rating = alert.textFields?[3].text else { return }
      
      var movie: MovieVO = MovieVO()
      movie.title = title
      movie.description = desc
      movie.opendate = opendate
      movie.rating = Double(rating)
      
      self.list.append(movie)
      
      self.tableView.reloadData()
    }
    
    let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    
    alert.addAction(ok)
    alert.addAction(cancel)
    
    self.present(alert, animated: true)
  }
  
  @IBAction func more(_ sender: UIButton) {
    self.page += 1
    
    callMovieAPI()
    self.tableView.reloadData()
  }
  
}

// MARK: - ListViewController

extension ListViewController {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segue_detail" {
      print("11111 :", sender)
      let path = self.tableView.indexPath(for: sender as! MovieCell)
      print("22222 :", path)
      
      let detailVC = segue.destination as? DetailViewController
      detailVC?.mvo = self.list[path!.row]
    }
  }
}
