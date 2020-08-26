//
//  DataManager.swift
//  Network_Practice
//
//  Created by JinBae Jeong on 2020/08/26.
//  Copyright © 2020 pino. All rights reserved.
//

import Foundation

// 데이터 관리를 총괄하는 임무를 준 아이.
final class DataManager {
  // 매니저가 여러명이면 작업이 산으로 가기 때문에 데이터는 한명이 관리하도록 싱글톤
  static let shared = DataManager()
  private init() {}
  
  // 데이터 받기 위한 네트워크도 Manager를 통해서 받도록
  let service = Service()
  
}
