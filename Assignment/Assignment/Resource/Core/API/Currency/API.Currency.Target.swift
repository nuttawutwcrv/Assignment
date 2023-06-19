//
//  API.Currency.Target.swift
//  Assignment

import Foundation
import Moya

extension API.Currency.Target: TargetType {
    
    var baseURL: URL {
        switch self
        {
        case let .list(baseUrl):
            return baseUrl
        }
    }
    
    var path: String {
        switch self {
        case .list:
            return "/currentprice.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .list:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .list:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
}

