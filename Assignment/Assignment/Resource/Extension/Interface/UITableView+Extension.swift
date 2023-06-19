//
//  UITableView+Extension.swift
//  Assignment

import Foundation
import UIKit

extension UITableView {
    
    func register(_ reuseIdentifier: String) {
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
}
