//
//  Service.swift
//  Network_Practice
//
//  Created by JinBae Jeong on 2020/08/26.
//  Copyright © 2020 pino. All rights reserved.
//

import Foundation

final class Service {
  
  func fetchCourseData(completion: @escaping (Result<[Course], Error>) -> ()) {
    guard let url = URL(string: Config.baseURL) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      if let error = error {
        completion(.failure(error))
        return
      }
      
      do {
        let courses = try JSONDecoder().decode([Course].self, from: data!)
        completion(.success(courses))
      } catch (let error) {
        completion(.failure(error))
      }
      
    }.resume()
  }
  
}
