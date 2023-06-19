//
//  HistoryViewModel.swift
//  Assignment

import UIKit

protocol HistoryInput: AnyObject {
    func fetchCurrency()
}

protocol HistoryOutput: AnyObject {
    var didGetCurrency: (() -> Void)? { get set }
}

class HistoryViewModel: HistoryInput, HistoryOutput {
    var didGetCurrency: (() -> Void)?
    var code: String?    
    var currencies = [CurrencyInfo]()
    var filteredList: [CurrencyInfo] {
        guard let code = code else { return [] }
        return currencies.filter({ $0.code == code })
    }
}

extension HistoryViewModel {

    func fetchCurrency() {
        currencies = DatabaseManager.shared.currencies()        
    }
}
