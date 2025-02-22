//
//  AuthModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import Foundation

struct AuthModel: Codable {
    let refresh: String
    let access: String
    let user: User?
}
