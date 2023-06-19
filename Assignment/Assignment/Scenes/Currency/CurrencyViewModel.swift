//
//  CurrencyViewModel.swift
//  Assignment

import UIKit

protocol CurrencyInput: AnyObject {
    func fetchCurrency()
}

protocol CurrencyOutput: AnyObject {
    var didGetCurrency: (() -> Void)? { get set }
}

class CurrencyViewModel: CurrencyInput, CurrencyOutput {
    var didGetCurrency: (() -> Void)?
    var currencies = [CurrencyInfo]()
    var timer: Timer!
    var api = API()
}

extension CurrencyViewModel {
    
    func fetchCurrency() {
        self.request()
        self.loop()
    }
    
    private func request() {
        api.currency.list { list in
            list.forEach { data in
                DatabaseManager.shared.addCurrency(data)
            }
            self.currencies = list
            self.didGetCurrency?()
        }
    }
    
    
    ///To show update data every minute, (Should be use Socket IO)
    
    private func loop() {
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
    }
    
    @objc private func runTimed() {
        self.request()
    }
}
