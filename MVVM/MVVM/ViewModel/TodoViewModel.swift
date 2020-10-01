//
//  TodoViewModel.swift
//  MVVM
//
//  Created by JinBae Jeong on 2020/09/30.
//

import Foundation

protocol TodoItemPresentable {
  var id: String? { get }
  var textValue: String? { get }
}

class TodoItemViewModel: TodoItemPresentable {
  var id: String? = "0"
  var textValue: String?
  
  init(id: String, textValue: String) {
    self.id = id
    self.textValue = textValue
  }
}

protocol TodoItemViewDelegate {
  func TodoItemAdded()
}

class TodoViewModel {
  init() {
    
    let item1 = TodoItemViewModel(id: "1", textValue: "Washing Clothes")
    let item2 = TodoItemViewModel(id: "2", textValue: "Study Hard")
    
    items.append(contentsOf: [item1, item2])
    
  }
  
  var newTodoItem: String?
  var items: [TodoItemPresentable] = []
}

extension TodoViewModel: TodoItemViewDelegate {
  func TodoItemAdded() {
    
  }
}
