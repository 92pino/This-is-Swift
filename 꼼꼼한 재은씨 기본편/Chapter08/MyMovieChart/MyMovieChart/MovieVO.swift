//
//  MovieVO.swift
//  MyMovieChart
//
//  Created by JinBae Jeong on 2020/11/10.
//

import Foundation
import UIKit

class MovieVO {
  // 모든 값들은 비어있을 수도 있으므로 옵셔널
  var thumbnail: String?
  var title: String?
  var description: String?
  var detail: String?
  var opendate: String?
  var rating: Double?
  
  var thumbnailImage: UIImage?
}
