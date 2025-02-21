//
//  SignUpViewModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation

@Observable
final class SignUpViewModel {
    var name: String = ""
    var lastName: String = ""
    var email: String = ""
    var password: String = ""
    
    
       var isEmailValid: Bool {
           return email.isValidEmail && email.isStringValid
       }
       
       var isPasswordValid: Bool {
           // Example: Minimum 8 characters, at least one uppercase, one lowercase, one number, and one special character.
           let passwordRegex = #"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$"#
           return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
       }
       
       var isFirstNameValid: Bool {
           return name.isStringValid && name.contains(where: { !$0.isWhitespace })
       }
       
       var isLastNameValid: Bool {
           return lastName.isStringValid && lastName.contains(where: { !$0.isWhitespace })
       }
    
    var isFormValid: Bool {
        return isEmailValid && isPasswordValid && isFirstNameValid && isLastNameValid
    }
    
    func registerUser(completion: @escaping (Bool) -> Void) {
        UserManager.shared.registerUser(withName: name, lastName: lastName, password: password, email: email) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
