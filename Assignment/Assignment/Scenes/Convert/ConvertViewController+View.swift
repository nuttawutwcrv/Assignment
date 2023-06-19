//
//  ConvertViewController+View.swift
//  Assignment

import UIKit

extension ConvertViewController {
    
    func setupInterface() {
        self.navigationItem.title = "Convert"
        self.setupButton()
    }
    
    func setupButton() {
        let optionClosure = {(action: UIAction) in
            self.textfield.text = nil
            self.viewModel.selected = action.title
            self.resultLabel.text = nil
        }
        
        var options = [UIAction]()
        for unit in self.viewModel.units {
            let action = UIAction(title: unit, state: .off, handler: optionClosure)
            options.append(action)
        }
        
        if let opt = options.first {
            self.viewModel.selected = opt.title
            opt.state = .on
        }
        
        let optionsMenu = UIMenu(title: "", options: .displayInline, children: options)
        self.popupButton.menu = optionsMenu
        self.popupButton.showsMenuAsPrimaryAction = true
    }
}
