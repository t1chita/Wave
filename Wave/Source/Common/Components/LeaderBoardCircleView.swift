//
//  LeaderBoardCircleView.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import SwiftUI

struct LeaderBoardCircleView: View {
    let user: User
    let rank: Int
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                if rank == 1 {
                    Image(systemName: "crown.fill")
                        .resizable()
                        .frame(width: 30, height: 24)
                        .offset(y: -12)
                        .foregroundStyle(.myGold)
                        .zIndex(1)
                }
                
                ZStack(alignment: .bottom) {
                    Circle()
                        .fill(
                            .myGreen
                        )
                        .frame(width: 80, height: 80)
                        .overlay(alignment: .center) {
                            Text(user.firstName.firstUppercased + user.lastName.firstUppercased)
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 1)
                                .fill(
                                    LinearGradient(colors: [.myBorder, .myBorder.opacity(0.1)],
                                                   startPoint: .bottom,
                                                   endPoint: .top)
                                )
                        }
                    
                    Text("\(rank)")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black.opacity(0.87))
                        .padding(8)
                        .background(Circle().fill(Color.myRank))
                        .offset(y: 15)
                }
            }
            
            HStack(spacing: 2) {
                Image(systemName: "leaf.arrow.triangle.circlepath")
                    .foregroundStyle(.myGreen)
                
                Text("\(user.totalEarnedEsgCoins ?? "") ESGC")
                    .foregroundStyle(.white)
                    .font(.system(size: 12, weight: .regular))
            }
            .offset(y: 12)
        }
    }
}
