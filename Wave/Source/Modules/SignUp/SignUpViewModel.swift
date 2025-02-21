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
    
    var isEmailValid: Bool = true
    var isPasswordValid: Bool = true
    var isFirstNameValid: Bool = true
    var isLastNameValid: Bool = true
}
