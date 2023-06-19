//
//  CurrencyViewController+View.swift
//  Assignment

import UIKit

extension CurrencyViewController {
    
    func setupInterface() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 110/255, green: 156/255, blue: 255/255, alpha: 1)
        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView.register("CurrencyTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}
