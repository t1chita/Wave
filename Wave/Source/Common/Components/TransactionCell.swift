//
//  TransactionCell.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import SwiftUI

struct TransactionCell: View {
    let transaction: TransactionModel
    
    var body: some View {
        HStack(spacing: 5) {
            Image(.myTrade)
                .resizable()
                .frame(width: 22, height: 22)
            
            VStack(alignment: .leading) {
                Text("Transaction")
                    .foregroundStyle(.white)
                    .font(.system(size: 12, weight: .regular))
                
                Text(transaction.merchantName)
                    .foregroundStyle(.white)
                    .font(.system(size: 14, weight: .semibold))
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("+\(transaction.esgCoins.formattedToTwoDecimals) ESGC")
                    .foregroundStyle(.white)
                    .font(.system(size: 14, weight: .semibold))
                
                Text("-$\(transaction.amount.formattedToTwoDecimals)")
                    .foregroundStyle(.white)
                    .font(.system(size: 14, weight: .semibold))
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(.myNavBackground)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 6)
                .stroke(lineWidth: 1)
                .foregroundStyle(.myBorder)
        }
    }
}
