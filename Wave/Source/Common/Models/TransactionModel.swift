//
//  TransactionModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation

struct TransactionModel: Identifiable {
    let id: String = UUID().uuidString
    let merchantName: String
    let esgCoins: Double
    let amount: Double
}
