//
//  LogInViewModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation

@Observable
final class LogInViewModel {
    var email: String = ""
    var password: String = ""
    
    var isEmailValid: Bool {
         return email.isValidEmail && email.isStringValid
     }
     
    var isPasswordValid: Bool = true
    
    var isFormValid: Bool {
        return isEmailValid && isPasswordValid
    }
    
    func logIn(completion: @escaping (Bool) -> Void) {
        UserManager.shared.logIn(withEmail: email, password: password, completion: completion)
    }
}
