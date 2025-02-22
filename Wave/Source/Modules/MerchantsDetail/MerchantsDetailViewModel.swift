//
//  MerchantsDetailViewModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation
import NetworkingPackage

@Observable
final class MerchantsDetailViewModel {
    let merchant: Merchant
    
    init(merchant: Merchant) {
        self.merchant = merchant
    }
    
    
    func purchaseItem(withId id: Int, completion: @escaping (Bool) -> Void) {
        NetworkService.shared.sendRequest(endPoint:
                                            EndPointsManager.purchaseItem(token:  UserManager.shared.authResponse?.access ?? "",
                                                                          id: id
                                                                         )) { (result: Result<Purchase, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success( _ ):
                    completion(true)
                case .failure(let failure):
                    print("DEBUG: Cant purchase item \(failure)")
                }
            }
        }
    }
}
import Foundation

struct Purchase: Decodable {
    let id: Int
    let product: Int
    let esgCoinsSpent: String
    let purchasedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case product
        case esgCoinsSpent = "esg_coins_spent"
        case purchasedAt = "purchased_at"
    }
}
