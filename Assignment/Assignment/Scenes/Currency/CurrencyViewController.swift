//
//  CurrencyViewController.swift
//  Assignment

import UIKit

class CurrencyViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = CurrencyViewModel()
    
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
    
    @IBAction func convert(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ConvertViewController") as! ConvertViewController
        vc.viewModel.currencies = viewModel.currencies
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CurrencyViewController {
    
    func didGetCurrency() -> (() -> Void) {
        return { [weak self] in
            self?.updateInterface()
        }
    }
}

extension CurrencyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as! CurrencyTableViewCell
        cell.currency = viewModel.currencies[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let code = viewModel.currencies[indexPath.row].code
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        vc.viewModel.code = code
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
