//
//  Model.swift
//  Network_Practice
//
//  Created by JinBae Jeong on 2020/08/26.
//  Copyright © 2020 pino. All rights reserved.
//

import Foundation

struct Course: Decodable {
  let id: Int
  let name: String
  let imageUrl: String
  let number_of_lessons: Int
}
