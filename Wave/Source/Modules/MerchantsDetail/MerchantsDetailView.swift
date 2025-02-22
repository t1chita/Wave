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
    @State private var splashScreen: Bool = false
    @State private var paymentResultType: PaymentResultType = .success
    var body: some View {

        ZStack {
            Color
                .myBackground
                .ignoresSafeArea()
            if splashScreen {
                PaymentResultView(style: paymentResultType) {
                    withAnimation {
                        splashScreen = false
                    }
                }
                .transition(.opacity)
                .zIndex(1)
            }
            content()
        }
        .gesture(DragGesture()
            .onChanged { value in
                if value.translation.width > 50 {
                    if router.navPath.count > 1 {
                        print(router.navPath.count)
                        router.navigateBack()
                        print(router.navPath.count)
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
                    ProductCell(product: product) {
                        vm.purchaseItem(withId: product.id) { success in
                            withAnimation {
                                paymentResultType = success ? .success : .failure
                                splashScreen = true
                            }
                        }
                    }
                }
            }
        }
    }
}


