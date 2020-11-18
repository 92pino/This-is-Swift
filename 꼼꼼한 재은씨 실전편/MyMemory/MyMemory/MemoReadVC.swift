//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by JinBae Jeong on 2020/11/18.
//

import UIKit

class MemoReadVC: UIViewController {
  
  // 컨텐츠 데이터를 저장하는 변수
  var param: MemoData?
  
  @IBOutlet var subject: UILabel!
  @IBOutlet var contents: UILabel!
  @IBOutlet var img: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    subject.text = param?.title
    contents.text = param?.contents
    img.image = param?.image
    
    let formatter = DateFormatter()
    formatter.dateFormat = "dd일 HH:mm분에 작성됨"
    let dateString = formatter.string(from: (param?.regdate)!)
    
    self.navigationItem.title = dateString
  }
  
}
