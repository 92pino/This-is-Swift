//
//  TodoItemTableViewCell.swift
//  MVVM
//
//  Created by JinBae Jeong on 2020/09/30.
//

import UIKit

class TodoItemTableViewCell: UITableViewCell {
  
  @IBOutlet weak var txtIndex: UILabel!
  @IBOutlet weak var txtTodoItem: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func configure(withViewModel viewModel: TodoItemPresentable) -> () {
    txtIndex.text = viewModel.id!
    txtTodoItem.text = viewModel.textValue!
  }
  
}
