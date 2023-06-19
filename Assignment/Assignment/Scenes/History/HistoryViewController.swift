//
//  HistoryViewController.swift
//  Assignment

import UIKit

class HistoryViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = HistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        bindingService()
        viewModel.fetchCurrency()
    }
    
    func bindingService() {
        viewModel.didGetCurrency = didGetCurrency()
    }
    
    func updateInterface() {
        self.tableView.reloadData()
    }
}

extension HistoryViewController {
    
    func didGetCurrency() -> (() -> Void) {
        return { [weak self] in
            self?.updateInterface()
        }
    }
}

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as! CurrencyTableViewCell
        cell.currency = viewModel.filteredList[indexPath.row]
        return cell
    }
}
