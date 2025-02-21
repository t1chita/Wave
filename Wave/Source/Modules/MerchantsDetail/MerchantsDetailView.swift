//
//  MerchantsDetailView.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import SwiftUI

struct MerchantsDetailView: View {
    @Bindable var vm: MerchantsDetailViewModel
    var body: some View {
        ZStack {
            Color
                .myBackground
                .ignoresSafeArea()
            
            content()
        }
        .scrollIndicators(.hidden)
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

#Preview {
    MerchantsDetailView(vm: MerchantsDetailViewModel(merchant:  Merchant(
        id: 1,
        name: "GreenCharge",
        description: "Charge green! GreenCharge produces chargers with recycled materials.",
        esgType: "ENV",
        esgValueRatio: "0.10",
        products: [
            Product(
                id: 1,
                name: "1M Charging Cable",
                description: "Our newest model",
                esgCoinsPrice: "30.00",
                picture: "http://ec1-ec2-lb-nginx-1937007172.eu-central-1.elb.amazonaws.com/media/product_images/backiee-88600.jpg",
                available: true,
                merchantName: "GreenCharge",
                merchant: 1
            ),
            Product(
                id: 2,
                name: "2M Charging Cable",
                description: "Our advanced model",
                esgCoinsPrice: "50.00",
                picture: "http://ec1-ec2-lb-nginx-1937007172.eu-central-1.elb.amazonaws.com/media/product_images/backiee-55009.jpg",
                available: true,
                merchantName: "GreenCharge",
                merchant: 1
            )
        ]
    )))
}


@Observable
final class MerchantsDetailViewModel {
    let merchant: Merchant
    
    init(merchant: Merchant) {
        self.merchant = merchant
    }
}
