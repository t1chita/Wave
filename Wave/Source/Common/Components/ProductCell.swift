//
//  ProductCell.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import SwiftUI

struct ProductCell: View {
    let product: Product
    let action: () -> Void
    var body: some View {
        VStack(spacing: 22) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    Text(product.esgCoinsPrice + " ESGC")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(.gray.opacity(0.75))
                }
                
                Spacer()
            }
            
            CachedImage(url: product.picture) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 289, height: 267)
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 289, height: 267)
                        .scaledToFill()
                case .failure( _ ):
                    Image(systemName: "xmark")
                        .symbolVariant(.circle.fill)
                        .foregroundStyle(.red)
                        .frame(width: 289, height: 267)
                @unknown default:
                    EmptyView()
                }
            }
            
            YRBankButton(text: "Purchase", style: .primary) {
               action()
            }
            .frame(width: 200)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .padding(.bottom, 40)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.myNavBackground)
        )
    }
}
