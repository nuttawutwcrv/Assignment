//
//  ConvertViewModel.swift
//  Assignment

import UIKit

protocol ConvertInput: AnyObject {
}

protocol ConvertOutput: AnyObject {
}

class ConvertViewModel: ConvertInput, ConvertOutput {
    var didGetCurrency: (() -> Void)?
    var currencies = [CurrencyInfo]()
    var units: [String] {
        return currencies.map({ $0.code })
    }
    var selected: String?
    var input = ""    
}

extension ConvertViewModel {
    
    func convert() -> Double? {
        
        guard let code = selected else { return nil }
        guard !input.isEmpty, input.regex(Constant.Formatt.RegularExpression.decimal.rawValue) else {
            return nil
        }
        
        guard let decimal = Decimal(string:input) else { return nil }
        
        guard let filtered = currencies.filter({ $0.code == code }).first else { return nil }
        
        let number = Double(truncating: decimal as NSNumber)
        
        return number/Double(filtered.rate_float)
    }
}
