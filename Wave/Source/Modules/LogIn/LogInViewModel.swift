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
    
    
    var isEmailValid: Bool = true
    var isPasswordValid: Bool = true
}
