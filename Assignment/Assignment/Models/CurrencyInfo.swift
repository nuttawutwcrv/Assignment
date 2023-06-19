//
//  CurrencyInfo.swift
//  Assignment

import Foundation
import ObjectMapper

class CurrencyInfo: NSObject, Mappable {
    
    var code = ""
    var name = ""
    var symbol = ""
    var rate = ""
    var rate_float: Float = 0
    var date = Date()
    
    
    override init() {}
    required init?(map: Map) {}
    
    /// Mapping  key
    func mapping(map: Map) {
        code <- map["code"]
        name <- map["description"]
        symbol <- map["symbol"]
        rate <- map["rate"]
        rate_float <- map["rate_float"]
        date = Date()
    }
}
