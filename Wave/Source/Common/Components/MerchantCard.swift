//
//  MerchantCard.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import SwiftUI

struct MerchantCard: View {
    let merchant: Merchant
    let action: () -> Void
    var body: some View {
        VStack(spacing: 13) {
            merchantTitle()
            
            esgCategoryAndValue()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundStyle(.myBackground)
                    .cornerRadius(40, corners: [.topLeft, .topRight])
                    .cornerRadius(14, corners: [.bottomLeft, .bottomRight])
                
                cellBackground()
            }
        )
        .padding(.horizontal)
    }
    
    private func merchantTitle() -> some View {
        HStack {
            Text(merchant.name)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
            
            Spacer()
            
            Button {
                action()
            } label: {
                Text("Get Directions")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.myGreen)
            }
        }
    }
    
    private func cellBackground() -> some View {
        GeometryReader { geo in
            Image(.cardBackground)
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
                .cornerRadius(40, corners: [.topLeft, .topRight])
                .cornerRadius(14, corners: [.bottomLeft, .bottomRight])
        }
    }
    
    private func esgCategoryAndValue() -> some View {
        HStack(spacing: 10) {
            Text("ESG: \(merchant.esgType)")
                .font(.system(size: 9, weight: .regular))
                .foregroundStyle(.gray.opacity(0.7))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .foregroundStyle(.myBackground)
                        .overlay {
                            Capsule()
                                .stroke(lineWidth: 1)
                                .fill(
                                    Color.myButtonBorder
                                )
                        }
                )
            
            Text("ESG value: 1 GEL = \(merchant.esgValueRatio) ESGC")
                .font(.system(size: 9, weight: .regular))
                .foregroundStyle(.gray.opacity(0.7))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .foregroundStyle(.myBackground)
                        .overlay {
                            Capsule()
                                .stroke(lineWidth: 1)
                                .fill(
                                    Color.myButtonBorder
                                )
                        }
                )
            
            Spacer()
        }
        
    }
    
}
