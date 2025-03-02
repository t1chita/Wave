//
//  MerchantsView.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import SwiftUI

struct MerchantsView: View {
    @State private var hasLoaded = false
    @Bindable var vm: MerchantsViewModel
    @EnvironmentObject var router: NavigationManager
    @EnvironmentObject var merchantsManager: MerchantsManager
    var body: some View {
        ZStack {
            Color
                .myBackground
                .ignoresSafeArea()
            
            content()
        }
        .scrollIndicators(.hidden)
        .navigationBarBackButtonHidden()
        .onAppear {
            if !hasLoaded {
                merchantsManager.getMerchants() // Your API call
                hasLoaded = true
            }
        }
    }
    
    private func content() -> some View {
        VStack(spacing: 30) {
            MyNavBar()
            
            description()
            
            merchantsList()
        }
        .padding(.horizontal)
    }
    
    private func description() -> some View {
        VStack(spacing: 10) {
            Text("Merchants")
                .font(.system(size: 28, weight: .semibold))
                .foregroundStyle(.white)
            
            Text("Explore exciting merchandise offered by our partnered stores, offering environmentally clean items! Be part of shaping a better future!")
                .multilineTextAlignment(.leading)
                .foregroundStyle(.gray.opacity(0.75))
                .font(.system(size: 14, weight: .regular))
        }
    }
    
    private func merchantsList() -> some View {
        ScrollView {
            VStack(spacing: 25) {
                ForEach(merchantsManager.merchants) { merchant in
                    MerchantCell(merchant: merchant) {
                        router.navigate(to: .merchantDetails(merchant: merchant))
                    }
                }
            }
        }
    }
}
