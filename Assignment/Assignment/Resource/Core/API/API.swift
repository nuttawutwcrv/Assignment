//
//  API.swift
//  Assignment

import Foundation
import ObjectMapper
import Moya

let kURL = URL(string: "https://api.coindesk.com/v1/bpi")!

class API {
    
    let currency = API.Currency(baseURL: kURL)
        
    static func castingArray<T: Mappable>(_ response: Response, path: String) -> [T]? {
        do {
            let repos = try response.filterSuccessfulStatusCodes().mapJSON()
            guard let repo = repos as? [String : Any], let data = repo[path] as? [String : Any] else { return nil }
            return Mapper<T>().mapArray(JSONObject: data.map({ $0.value }))
        } catch {
            return nil
        }
    }
    
    /*
    static func castingObject<T: Mappable>(_ response: Response, path: String) -> T? {
        return nil
    }*/
}
