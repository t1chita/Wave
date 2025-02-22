//
//  LeaderBoardView.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import SwiftUI

struct LeaderBoardView: View {
    @Bindable var vm: LeaderBoardViewModel
    @EnvironmentObject var router: NavigationManager
    var body: some View {
        ZStack {
            Color
                .myBackground
                .ignoresSafeArea()
            
            content()
        }
        .onAppear {
            vm.getLeaderBoard()
        }
    }
    
    private func content() -> some View {
        VStack(spacing: 70) {
            HStack(spacing: 40) { // Adjust spacing as needed
                if vm.topThree.count > 1 {
                    LeaderBoardCircleView(user: vm.topThree[1], rank: 2) // 2nd place (Left)
                        .scaleEffect(1.1) // Make it slightly bigger
                        .offset(y: -10)
                }
                
                if vm.topThree.count > 0 {
                    LeaderBoardCircleView(user: vm.topThree[0], rank: 1) // 1st place (Center)
                        .scaleEffect(1.2) // Make it slightly bigger
                        .offset(y: -20)
                }
                
                if vm.topThree.count > 2 {
                    LeaderBoardCircleView(user: vm.topThree[2], rank: 3) // 3rd place (Right)
                }
            }
            
            VStack {
                HStack {
                    Text("Leaderboard")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                ScrollView {
                    ForEach(0..<vm.remainingUsers.count, id: \.self) { index in
                        LeaderBoardListCell(user: vm.remainingUsers[index], rank: index + 4)
                    }
                }
            }
            .offset(y: 20)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(.leaderBoardBackground)
            )
            .ignoresSafeArea()
        }
        .padding(.top, 46)
    }
}


#Preview{
    LeaderBoardView(vm: LeaderBoardViewModel())
}
