//
//  UIViewController+Extension.swift
//  MyMovieChart
//
//  Created by JinBae Jeong on 2020/11/16.
//

import UIKit

// MARK: - Alert Extensions

extension UIViewController {
  func alert(_ message: String, onClick: (() -> Void)? = nil) {
    let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    controller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (_) in
      onClick?()
    }))
    
    DispatchQueue.main.async {
      self.present(controller, animated: false, completion: nil)
    }
  }
}
