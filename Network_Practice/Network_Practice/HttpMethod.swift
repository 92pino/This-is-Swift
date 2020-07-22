//
//  HttpMethod.swift
//  Network_Practice
//
//  Created by jbjeong on 2020/07/22.
//  Copyright © 2020 정진배. All rights reserved.
//

import Foundation

enum HttpMethod<Body> {
    case get
    case post(Body)
    case put(Body)
    case patch(Body)
    case delete(Body)
}

extension HttpMethod {
    var method: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}
