//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by JinBae Jeong on 2020/11/16.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var wv: WKWebView!
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  var mvo: MovieVO!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("\n---------- [ mvo ] ----------\n")
    print(mvo.detail)
    print(mvo.title)
    print("\n---------- [ mvo ] ----------\n")
    
    self.wv.navigationDelegate = self
    
    navigationItem.title = mvo.title!
    
    if let url = self.mvo.detail {
      if let urlObj = URL(string: url) {
        let req = URLRequest(url: urlObj)
        print(wv.isLoading)
        self.wv.load(req)
      } else {
        let alert = UIAlertController(title: "오류", message: "잘못된 URL입니다", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
          _ = self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
      }
    } else {
      let alert = UIAlertController(title: "오류", message: "필수 파라미터가 누락되었습니다.", preferredStyle: .alert)
      let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
        _ = self.navigationController?.popViewController(animated: true)
      }
      
      alert.addAction(cancelAction)
      self.present(alert, animated: true, completion: nil)
    }
  }
  
}

// MARK: - WKNavigationDelegate

extension DetailViewController: WKNavigationDelegate {
  // 웹뷰가 콘텐츠를 받기 시작할 때 호출
  func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    self.spinner.startAnimating()
  }
  
  // 웹뷰가 콘텐츠 로딩을 완전히 마쳤을 때 호출
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    self.spinner.stopAnimating()
  }
  
  // 웹뷰가 콘텐츠 로딩에 실패했을 때 호출
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    self.spinner.stopAnimating()
    
    alert("상세 페이지를 읽어오지 못했습니다.")
    _ = self.navigationController?.popViewController(animated: true)
  }
  
  // URL이 잘못되었거나, 네트워크가 정상적이지 않아서 웹 페이지를 못 불러왔을 경우 호출
  func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    self.spinner.stopAnimating()
    
    self.alert("상세 페이지를 읽어오지 못했습니다.") {
      _ = self.navigationController?.popViewController(animated: true)
    }
  }
}
