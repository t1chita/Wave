//
//  ProfileViewModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation
import NetworkingPackage

@Observable
final class ProfileViewModel {
    var purchases: [PurchasedItem] = []
    var transactions: [TransactionItemModel] = []
    
    var totalAmount: Double {
        return transactions.compactMap { $0.amountDouble }.reduce(0, +)
      }

    
    func getPurchasedItems() {
        NetworkService.shared.sendRequest(endPoint: EndPointsManager.getPurchasedItems(token: UserManager.shared.authResponse?.access ?? "")
        ) { [weak self] (result: Result<[PurchasedItem], NetworkError>) in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let success):
                    self?.purchases = success
                case .failure(let failure):
                    print("Debug: Can't fetch purchased Items \(failure)")
                }
            }
        }
    }
    
    func getTransactions() {
        NetworkService.shared.sendRequest(endPoint: EndPointsManager.getTransactions(token: UserManager.shared.authResponse?.access ?? "")
        ) { [weak self] (result: Result<[TransactionItemModel], NetworkError>) in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let success):
                    self?.transactions = success
                case .failure(let failure):
                    print("Debug: Can't fetch purchased Items \(failure)")
                }
            }
        }
    }
}
