//
//  MerchantModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation

struct Merchant: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let description: String
    let esgType: String
    let esgValueRatio: String
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, products
        case esgType = "esg_type"
        case esgValueRatio = "esg_value_ratio"
    }
    static func == (lhs: Merchant, rhs: Merchant) -> Bool {
        return lhs.id == rhs.id &&
               lhs.name == rhs.name &&
               lhs.description == rhs.description &&
               lhs.esgType == rhs.esgType &&
               lhs.esgValueRatio == rhs.esgValueRatio &&
               lhs.products == rhs.products
    }
}

struct Product: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let description: String
    let esgCoinsPrice: String
    let picture: String
    let available: Bool
    let merchantName: String
    let merchant: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, available, merchant
        case esgCoinsPrice = "esg_coins_price"
        case picture = "picture"
        case merchantName = "merchant_name"
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
          return lhs.id == rhs.id &&
                 lhs.name == rhs.name &&
                 lhs.description == rhs.description &&
                 lhs.esgCoinsPrice == rhs.esgCoinsPrice &&
                 lhs.picture == rhs.picture &&
                 lhs.available == rhs.available &&
                 lhs.merchantName == rhs.merchantName &&
                 lhs.merchant == rhs.merchant
      }
}
