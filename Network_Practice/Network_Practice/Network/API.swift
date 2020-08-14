//
//  API.swift
//  Network_Practice
//
//  Created by jbjeong on 2020/07/22.
//  Copyright © 2020 정진배. All rights reserved.
//

import Foundation

class API {
    // request 요청시 사용자가 설정한 error 값도 던질수 있게 설정
    enum APIError: LocalizedError {
        case urlNotSupport
        case noData
        
        var errorDescription: String? {
            switch self {
            case .urlNotSupport:
                return "URL NOT Supported"
            case .noData:
                return "Has No Data"
            }
        }
    }
    
    // Singleton 으로 API 객체를 생성하여 관리
    static let shared: API = API()
    
    private lazy var defaultSession = URLSession(configuration: .default)
    
    private init() {}
    
    //
    func get1(completionHandler: @escaping (Result<[UserData], APIError>) -> ()) {
        guard let url = URL(string: "\(Config.baseURL)/posts") else {
            completionHandler(.failure(.urlNotSupport))
            return
        }
        
        let resource = Network<[UserData]>(url: url)
        defaultSession.load(resource) { userDatas, _ in
            guard let data = userDatas, !data.isEmpty else {
                completionHandler(.failure(.noData))
                return
            }
            completionHandler(.success(data))
        }
    }
    
    func get2(completionHandler: @escaping (Result<[UserData], APIError>) -> ()) {
        
    }
}
