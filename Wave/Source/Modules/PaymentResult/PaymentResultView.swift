//
//  PaymentResultView.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import SwiftUI

enum PaymentResultType {
    case failure
    case success
}

struct PaymentResultView: View {
    let style: PaymentResultType
    let action: () -> Void
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: image)
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundStyle(imageColor)
            
            VStack(spacing: 8) {
                Text(title)
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .semibold))
                
                Text(desc)
                    .foregroundStyle(.white.opacity(0.8))
                    .font(.system(size: 14, weight: .regular))
                    .multilineTextAlignment(.center)

            }
            
            YRBankButton(
                text: buttonText,
                style: .primary,
                action: action
            )
        }
        .padding(24)
        .background(
            ZStack {
                Color.myBackground
                GeometryReader { geo in
                    Image(.templateGreen)
                          .resizable()
                          .scaledToFill()
                          .frame(width: geo.size.width, height: geo.size.height)
                          .clipped()
                          .opacity(0.03)
                  }
            }
        )
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 1)
                .foregroundStyle(.white)
        }
        .padding(.horizontal)
    }
    
    
    private var image: String {
        switch style {
        case .success:
            return  "checkmark.circle"
        case .failure:
            return "x.circle"
        }
    }
    
    private var imageColor: Color {
        switch style {
        case .failure:
            return .red.opacity(0.8)
        case .success:
            return .myGreen
        }
    }
    
    private var title: String {
        switch style {
        case .failure:
            return "Transaction Failed"
        case .success:
            return "Transaction Successed"
        }
    }
    
    private var desc: String {
        switch style {
        case .failure:
            return "Something went wrong. Please try again later or contact support."
        case .success:
            return "Your payment has been successfully processed. Thank you for your transaction!"
        }
    }
    
    private var buttonText: String {
        switch style {
        case .failure:
            return "Retry"
        case .success:
            return "Done"
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        PaymentResultView(style: .success) { print("Succ") }
        PaymentResultView(style: .failure) { print("Fail") }
    }
}
