//
//  PurchasedItem.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import Foundation

struct PurchasedItem: Codable, Identifiable {
    var id: Int
    var product: Int
    var esgCoinsSpent: String
    var purchasedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case product
        case esgCoinsSpent = "esg_coins_spent"
        case purchasedAt = "purchased_at"
    }
    
    var formattedPurchaseDate: String? {
         let formatter = DateFormatter()
         
         // Define the original format of the purchasedAt string
         formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
         
         // Convert the string to Date
         if let date = formatter.date(from: purchasedAt) {
             // Format the Date into "year, month, day"
             formatter.dateFormat = "yyyy, MM, dd"
             return formatter.string(from: date)
         }
         
         return nil
     }
}
