//
//  CurrencyTableViewCell.swift
//  Assignment

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblCode: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    var currency: CurrencyInfo? {
        didSet {
            self.updateInterface()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateInterface() {
        if let item = self.currency {
            lblCode.text = item.code
            lblName.text = item.name
            lblRate.text = item.rate
        }
    }
}
