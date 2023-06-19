//
//  ConvertViewController.swift
//  Assignment

import UIKit

class ConvertViewController : UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var popupButton: UIButton!
    @IBOutlet weak var textfield: UITextField!
    
    var viewModel = ConvertViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
}

extension ConvertViewController: UITextFieldDelegate {
    
    @IBAction func textFieldDidChange(_ textField: UITextField) {
        
        guard let text = textField.text, !text.isEmpty else {
            resultLabel.text = nil
            return
        }
        
        viewModel.input = text
        let convert = viewModel.convert()
        
        if let results = convert {
            resultLabel.text = String(format: "= %.10f Bitcoin", results)
        } else {
            resultLabel.text = nil
        }
    }
}
