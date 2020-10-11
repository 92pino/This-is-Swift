//
//  UserTableCell.swift
//  UserDefaults_Demo
//
//  Created by JinBae Jeong on 2020/10/07.
//

import UIKit

class UserTableCell: UITableViewCell {
  
  let title: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(title: String?) {
    self.title.text = "타이틀 없음"
  }
  
  private func configureUI() {
    addSubview(title)
    NSLayoutConstraint.activate([
      title.centerYAnchor.constraint(equalTo: centerYAnchor),
      title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
    ])
  }
  
}
