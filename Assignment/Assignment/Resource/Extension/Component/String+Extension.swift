//
//  String+Extension.swift
//  Assignment

import Foundation

extension String {
    
    func regex(_ pattern: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: self.count)
        if regex.matches(in: self, options: [], range: range).count > 0 {
            return true
        }
        return false
    }
}
