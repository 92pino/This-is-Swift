//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by JinBae Jeong on 2020/11/09.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var result: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // 화면이 뜨자마자 바로 알럿창을 띄워줘야할 때 위치
  override func viewDidAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .actionSheet)
    
    let ok = UIAlertAction(title: "확인", style: .default) { _ in
      self.result.text = "확인 버튼을 클릭했습니다"
    }
    let exec = UIAlertAction(title: "실행", style: .destructive) { _ in
      self.result.text = "실행 버튼을 클릭했습니다"
    }
    let stop = UIAlertAction(title: "중지", style: .default) { _ in
      self.result.text = "중지 버튼을 클릭했습니다"
    }
    let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in
      self.result.text = "취소 버튼을 클릭했습니다"
    }
    
    // .alert에서 action이 2개 이상일 경우 세로로 정렬
    // 2개 이하일 경우 가로 정렬
    // cancel은 항상 제일 하단에 위치 (2개 이상)
    alert.addAction(stop)
    alert.addAction(exec)
    alert.addAction(cancel)
    alert.addAction(ok)
    
    self.present(alert, animated: true)
  }

  @IBAction func alert(_ sender: UIButton) {
//    let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
    let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .actionSheet)
    
    let ok = UIAlertAction(title: "확인", style: .default) { _ in
      self.result.text = "확인 버튼을 클릭했습니다"
    }
    let exec = UIAlertAction(title: "실행", style: .destructive) { _ in
      self.result.text = "실행 버튼을 클릭했습니다"
    }
    let stop = UIAlertAction(title: "중지", style: .default) { _ in
      self.result.text = "중지 버튼을 클릭했습니다"
    }
    let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in
      self.result.text = "취소 버튼을 클릭했습니다"
    }
    
    // .alert에서 action이 2개 이상일 경우 세로로 정렬
    // 2개 이하일 경우 가로 정렬
    // cancel은 항상 제일 하단에 위치 (2개 이상)
    alert.addAction(stop)
    alert.addAction(exec)
    alert.addAction(cancel)
    alert.addAction(ok)
    
    self.present(alert, animated: true)
  }
  
  @IBAction func login(_ sender: UIButton) {
    let title = "iTunes Store에 로그인"
    let message = "사용자의 Apple ID sqlpro@naver.com의 암호를 입력하십시오"
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let cancel = UIAlertAction(title: "취소", style: .cancel)
    let ok = UIAlertAction(title: "확인", style: .default) { _ in
      if let tf = alert.textFields?.first {
        print("입력된 값은 \(tf.text!)입니다.")
      } else {
        print("입력된 값이 없습니다")
      }
    }
    
    alert.addAction(ok)
    alert.addAction(cancel)
    
    alert.addTextField { (tf) in
      tf.placeholder = "암호"
      tf.isSecureTextEntry = true
    }
    alert.addTextField { (ttf) in
      ttf.placeholder = "테스트"
    }
    alert.addTextField {
      $0.placeholder = "비밀번호"
      $0.isSecureTextEntry = true
    }
    
    self.present(alert, animated: true)
  }
  
  @IBAction func auth(_ sender: UIButton) {
    let msg = "로그인"
    let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
    let cancel = UIAlertAction(title: "취소", style: .cancel)
    let ok = UIAlertAction(title: "확인", style: .default) { _ in
      let loginId = alert.textFields?.first?.text
      let loginPw = alert.textFields?.last?.text
      
      if loginId == "sqlpro" && loginPw == "1234" {
        self.result.text = "인증되었습니다"
      } else {
        self.result.text = "인증에 실패하였습니다"
      }
    }
    
    alert.addAction(ok)
    alert.addAction(cancel)
    
    alert.addTextField { (tf) in
      tf.placeholder = "아이디"
    }
    alert.addTextField { (tf) in
      tf.placeholder = "비밀번호"
      tf.isSecureTextEntry = true
    }
    
    self.present(alert, animated: true)
  }
}

