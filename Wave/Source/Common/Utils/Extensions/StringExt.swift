//
//  StringExt.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isStringValid: Bool {
        !self.isEmpty
    }
    
    var firstUppercased: String {
        guard let firstLetter = self.first else { return "" }
        return String(firstLetter).uppercased()
    }
    
    func capitalizedFirstLetter() -> String {
        guard let first = self.first else { return self }
        return first.uppercased() + self.dropFirst()
    }
    
}
