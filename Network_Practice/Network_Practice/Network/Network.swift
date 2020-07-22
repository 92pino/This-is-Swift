//
//  Network.swift
//  Network_Practice
//
//  Created by jbjeong on 2020/07/22.
//  Copyright © 2020 정진배. All rights reserved.
//

import Foundation

struct Network<T> {
    var urlRequest: URLRequest
    let parse: (Data) -> T?
}

extension Network where T: Decodable {
    
    // 기본 GET 방식의 request (parameters 없을 경우)
    // URL을 던져주고, 결과로 나오는 data를 Decodable Type으로 파싱
    init(url: URL) {
        self.urlRequest = URLRequest(url: url)
        self.parse = { data in
            try? JSONDecoder().decode(T.self, from: data)
        }
    }
    
    // GET 방식의 request (parameters 있는 경우)
    // https://baseURL.com/?name=value 형태로 변환하여 url 요청
    // parameters는 dictionary로 받지만 값은 내부에서 URLQueryItem으로 추가
    // 결과로 나온 url을 URLComponent에서 꺼내어 사용
    init(url: String, parameters _parameters: [String: String]) {
        var component = URLComponents(string: url)
        var parameters = [URLQueryItem]()
        for (name, value) in _parameters {
            if name.isEmpty { continue }
            parameters.append(URLQueryItem(name: name, value: value))
        }
        
        if !parameters.isEmpty {
            component?.queryItems = parameters
        }
        
        if let componentURL = component?.url {
            self.urlRequest = URLRequest(url: componentURL)
        } else {
            self.urlRequest = URLRequest(url: URL(string: url)!)
        }
        
        self.parse = { data in
            try? JSONDecoder().decode(T.self, from: data)
        }
    }
    
    init<Body: Encodable>(url: URL, method: HttpMethod<Body>) {
        self.urlRequest = URLRequest(url: url)
        self.urlRequest.httpMethod = method.method
        switch method {
        case .post(let body), .delete(let body), .patch(let body), .put(let body):
            self.urlRequest.httpBody = try? JSONEncoder().encode(body)
            self.urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            self.urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        default:
            break
        }
        self.parse = {data in
            try? JSONDecoder().decode(T.self, from: data)
        }
    }
}
