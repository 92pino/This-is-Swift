//
//  URLSession+Extension.swift
//  Network_Practice
//
//  Created by jbjeong on 2020/07/22.
//  Copyright © 2020 정진배. All rights reserved.
//

import Foundation

extension URLSession {
    func load<T>(_ resource: Network<T>, completion: @escaping (T?, Bool) -> Void) {
        dataTask(with: resource.urlRequest) { data, response, _ in
            if let response = response as? HTTPURLResponse,
                (200..<300).contains(response.statusCode) {
                completion(data.flatMap(resource.parse), true)
            } else {
                completion(nil, false)
            }
        }.resume()
    }
}
