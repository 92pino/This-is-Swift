//
//  LocationCell.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/24.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import SnapKit

class LocationCell: UITableViewCell {

  // Mark: - Properties
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.text = "123 Main Street"
    
    return label
  }()
  
  private let addressLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .lightGray
    label.text = "123 Main Street, Washington, DC"
    
    return label
  }()
  
  // Mark: - Lifecycle
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    selectionStyle = .none
    
    let stack = UIStackView(arrangedSubviews: [titleLabel, addressLabel])
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.spacing = 4
    
    addSubview(stack)
    stack.snp.makeConstraints {
      $0.centerY.equalTo(self.snp.centerY)
      $0.left.equalToSuperview().offset(12)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // Mark: - Selectors

}
