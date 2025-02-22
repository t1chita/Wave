//
//  User.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import Foundation

struct User: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let availableEsgCoins: String?
    let totalEarnedEsgCoins: String?

    enum CodingKeys: String, CodingKey {
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case availableEsgCoins = "available_esg_coins"
        case totalEarnedEsgCoins = "total_earned_esg_coins"
    }
}
