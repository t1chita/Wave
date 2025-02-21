//
//  MerchantCell.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import SwiftUI

struct MerchantCell: View {
    let merchant: Merchant
    let action: () -> Void
    var body: some View {
        
        VStack(spacing: 20) {
            VStack(spacing: 13) {
                merchantTitle()
                
                esgCategoryAndValue()
                
                merchantDesc()
            }
            
            YRBankButton(
                text: "View Merchandise",
                style: .primary) {
                    action()
                }
                .frame(width: 200)
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
        .padding(.bottom, 37)
        .background(
            cellBackground()
        )
        .overlay {
            cellBorder()
        }
    }
    
    private func merchantDesc() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("About This Merchant")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.white)
                
                Text(merchant.description)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.gray.opacity(0.7))
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
        }
    }
    
    private func merchantTitle() -> some View {
        HStack {
            Text(merchant.name)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
            
            Spacer()
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
                .opacity(0.4)
        }
    }
    
    private func cellBorder() -> some View {
        UnevenRoundedRectangle(
            topLeadingRadius: 40,
            bottomLeadingRadius: 14,
            bottomTrailingRadius: 14,
            topTrailingRadius: 40)
        .stroke(lineWidth: 1)
        .fill(
            LinearGradient(colors: [.myBorder,
                                    .myGreen,
                                    .myGreen.opacity(0.7)],
                           startPoint: .leading,
                           endPoint: .trailing)
        )
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
