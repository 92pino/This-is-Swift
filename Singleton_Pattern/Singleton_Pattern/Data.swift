//
//  Data.swift
//  Singleton_Pattern
//
//  Created by JinBae Jeong on 2020/10/20.
//

import Foundation

class NormalClass {
  // static 전역 변수로 선언하는데 이 프로퍼티는 lazy로 생성되기 때문에 처음 Singleton(NormalClass)가 생성되기 전까지는 메모리에 올라가지 않는다.
  static let shared = NormalClass()
  var x = 0
  
  // 의도해서 여러번 생성되는 것이 아니라면 그것을 막아서 새로운 객체가 생성되어 유일성이 사라지는 문제를 해결해야 하는데
  // 생성자를 private으로 제한해서 외부에서 인스턴스를 생성하지 못하도록 강제하여, 유니크한 싱글톤을 만든다.
  // 하나의 싱글톤 인스턴스가 유지되어 여러 객체가 하나의 인스턴스에 접근하여 데이터를 공유할수 있다.
  private init() {
    
  }
}
