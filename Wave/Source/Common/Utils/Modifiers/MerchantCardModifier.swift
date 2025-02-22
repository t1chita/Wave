//
//  MerchantCardModifier.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import SwiftUI

struct MerchantCardModifier: ViewModifier {
    @Binding var merchant: Merchant?
    @State private var visibleMerchant: Merchant?
    @State private var isVisible = false
    @State private var workItem: DispatchWorkItem?
    let action: () -> Void
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    if isVisible, let merchant = visibleMerchant {
                        mainToastView(merchant: merchant)
                            .offset(y: -30)
                    }
                }
            )
            .onChange(of: merchant) { oldMerchant, newMerchant in
                handleMerchantChange(newMerchant: newMerchant)
            }
    }
    
    @ViewBuilder
    private func mainToastView(merchant: Merchant) -> some View {
        VStack {
            Spacer()
            
            MerchantCard(merchant: merchant, action: action)
        }
        .transition(.move(edge: .bottom))
    }
    
    private func handleMerchantChange(newMerchant: Merchant?) {
        workItem?.cancel() // Cancel any ongoing dismissal task
        
        if let newMerchant = newMerchant {
            // Slide down current toast, then update and slide up new one
            isVisible = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { // Adjust delay for smooth transition
                withAnimation {
                    visibleMerchant = newMerchant
                    isVisible = true
                }
            }
        } else {
            withAnimation {
                isVisible = false
            }
        }
    }
}
