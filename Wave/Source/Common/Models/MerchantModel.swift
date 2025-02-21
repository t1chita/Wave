//
//  MerchantModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation

struct Merchant: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let esgValue: String
    let description: String
}
