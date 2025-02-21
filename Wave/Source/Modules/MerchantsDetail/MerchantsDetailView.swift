//
//  MerchantsDetailView.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import SwiftUI

struct MerchantsDetailView: View {
    @Bindable var vm: MerchantsDetailViewModel
    @EnvironmentObject var router: NavigationManager
    var body: some View {
        ZStack {
            Color
                .myBackground
                .ignoresSafeArea()
            
            content()
        }
        .gesture(DragGesture()
            .onChanged { value in
                if value.translation.width > 50 {
                    if router.navPath.count > 1 {
                        router.navigateBack()
                    }
                }
            }
        )
        .scrollIndicators(.hidden)
        .navigationBarBackButtonHidden()
    }
    
    private func content() -> some View {
        VStack(spacing: 30) {
            MyNavBar()
            
            description()
            
            productList()
        }
        .padding(.horizontal)
    }
    
    private func description() -> some View {
        VStack(spacing: 10) {
            Text(vm.merchant.name)
                .font(.system(size: 28, weight: .semibold))
                .foregroundStyle(.white)
            
            Text(vm.merchant.description)
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray.opacity(0.75))
                .font(.system(size: 14, weight: .regular))
        }
    }
    
    private func productList() -> some View {
        ScrollView {
            VStack(spacing: 25) {
                ForEach(vm.merchant.products) { product in
                    ProductCell(product: product)
                }
            }
        }
    }
}


