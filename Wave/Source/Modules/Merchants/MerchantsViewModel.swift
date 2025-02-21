//
//  MerchantsViewModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation
import NetworkingPackage

@Observable
final class MerchantsViewModel {
    var merchants: [Merchant] = []
    
    init() {
        getMerchants()
    }
    
    func getMerchants() {
        NetworkService.shared.sendRequest(
            endPoint: EndPointsManager.getMerchants(
            token: UserManager.shared.authResponse?.access ?? ""
            )) { [weak self] (result: Result<[Merchant], NetworkError>) in
                DispatchQueue.main.async { [weak self] in
                    switch result {
                    case .success(let success):
                        self?.merchants = success
                    case .failure(let failure):
                        print("DEBUG: Merchant Fetching Has Failed \(failure)")
                    }
                }
        }
    }
}
