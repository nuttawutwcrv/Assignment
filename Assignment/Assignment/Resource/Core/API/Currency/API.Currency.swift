//
//  API.Currency.swift
//  Assignment

import Foundation
import ObjectMapper
import Moya

extension API {
    
    class Currency {
        private let baseURL: URL
        private let provider: MoyaProvider<Target>
        
        init(baseURL: URL) {
            self.baseURL = baseURL
            provider = MoyaProvider<Target>()
        }
        
        enum Target {
            case list(baseUrl: URL)
        }
        
        func cancel() {
            provider.session.cancelAllRequests()
        }
        
        func list(_ completion: (([CurrencyInfo]) -> ())? = nil) {
            
            provider.request(.list(baseUrl: baseURL)) { result in                
                switch result {
                case let .success(response):
                    if let items: [CurrencyInfo] = API.castingArray(response, path: "bpi") {
                        completion?(items)
                    }
                case .failure(_): break
                }
            }
        }
    }
}
