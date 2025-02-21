//
//  MerchantModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation

struct Merchant: Identifiable, Codable {
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
}

struct Product: Identifiable, Codable {
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
}
