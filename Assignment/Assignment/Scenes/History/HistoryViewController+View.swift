//
//  HistoryViewController+View.swift
//  Assignment

import UIKit

extension HistoryViewController {
    
    func setupInterface() {
        self.setupTableView()
        self.navigationItem.title = "History"
    }
    
    func setupTableView() {
        self.tableView.register("CurrencyTableViewCell")
        self.tableView.dataSource = self
    }
}
