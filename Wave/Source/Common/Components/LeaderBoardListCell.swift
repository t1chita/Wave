//
//  LeaderBoardListCell.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import SwiftUI

struct LeaderBoardListCell: View {
    let user: User
    let rank: Int
    
    var body: some View {
        HStack(spacing: 8) {
            Text("\(rank)")
                .font(.headline)
                .foregroundColor(.gray)
            
            Circle()
                .fill(
                    Color.myGreen
                )
                .frame(width: 32, height: 32)
                .overlay(alignment: .center) {
                    Text(user.firstName.firstUppercased + user.lastName.firstUppercased)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(.black.opacity(0.87))
                }
            Text(user.firstName.capitalizedFirstLetter() + " " + user.lastName.capitalizedFirstLetter())
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("\(user.totalEarnedEsgCoins ?? "") ESGC")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(Color.myBackground)
        .cornerRadius(16)
    }
}
