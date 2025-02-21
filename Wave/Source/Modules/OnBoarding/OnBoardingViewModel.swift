//
//  OnBoardingViewModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation

@Observable
final class OnBoardingViewModel {
    let transactions: [TransactionModel] = [
        TransactionModel(merchantName: "ESG Merchant 1", esgCoins: 0.15, amount: 68.00),
        TransactionModel(merchantName: "ESG Merchant 2", esgCoins: 0.15, amount: 68.00),
        TransactionModel(merchantName: "ESG Merchant 3", esgCoins: 0.15, amount: 68.00)
    ]
}
