//
//  ProfileView.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import SwiftUI

struct ProfileView: View {
    @Bindable var vm: ProfileViewModel
    @EnvironmentObject var router: NavigationManager
    @EnvironmentObject var merchantManager: MerchantsManager
    var body: some View {
        ZStack {
            Color
                .myBackground
                .ignoresSafeArea()
            
            content()
        }
        .onAppear {
            DispatchQueue.global(qos: .background).async {
                vm.getPurchasedItems()
                vm.getTransactions()
            }
        }
    }

    private func content() -> some View {
        VStack(spacing: 24) {
            profileInfo()
            
            purchasesCard()
        }
    }
    
    private func profileInfo() -> some View {
        VStack(spacing: 8) {
            profileImage()
            
            Text((UserManager.shared.user?.firstName.capitalizedFirstLetter() ?? "") + " " + (UserManager.shared.user?.lastName.capitalizedFirstLetter() ?? ""))
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(.white)
            
            Text(UserManager.shared.user?.email ?? "")
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(.gray.opacity(0.75))
        }
    }
    
    private func profileImage() -> some View {
        Circle()
            .fill(
                .myGreen
            )
            .frame(width: 80, height: 80)
            .overlay(alignment: .center) {
                Text((UserManager.shared.user?.firstName.firstUppercased ?? "") + (UserManager.shared.user?.lastName.firstUppercased ?? ""))
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
    }
    
    private func purchasesCard() -> some View {
        VStack(spacing: 12) {
            Text("Your Transactions")
                .foregroundStyle(.myGreen)
                .font(.system(size: 24, weight: .semibold))
            
            VStack {
                Text("Total GEL spent: \(String(vm.totalAmount))")
                    .foregroundStyle(.gray.opacity(0.8))
                    .font(.system(size: 12, weight: .regular))
                
                Text("Total ESGC gained: \(UserManager.shared.user?.totalEarnedEsgCoins ?? "")")
                    .foregroundStyle(.gray.opacity(0.8))
                    .font(.system(size: 12, weight: .regular))
                
                Text("Current ESGC: \(UserManager.shared.user?.availableEsgCoins ?? "")")
                    .foregroundStyle(.gray.opacity(0.8))
                    .font(.system(size: 12, weight: .regular))
            }
            
            ScrollView {
                ForEach(vm.transactions) { item in
                    TransactionCell(transaction:
                                        TransactionModel(merchantName: merchantManager.merchants.first(where: { $0.id == item.merchant })?.name ?? "",
                                                         esgCoins: item.earnedEsgCoins,
                                                         amount: item.amountDouble ?? 0))
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ProfileView(vm: ProfileViewModel())
        .environmentObject(MerchantsManager())
}
