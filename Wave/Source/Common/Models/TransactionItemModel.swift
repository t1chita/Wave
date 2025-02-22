//
//  TransactionItemModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import Foundation

struct TransactionItemModel: Codable, Identifiable {
    var id: Int
    var merchant: Int
    var amount: String
    var transactionDate: String
    var earnedEsgCoins: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case merchant
        case amount
        case transactionDate = "transaction_date"
        case earnedEsgCoins = "earned_esg_coins"
    }
    
    var amountDouble: Double? {
          return Double(amount)
      }
}
