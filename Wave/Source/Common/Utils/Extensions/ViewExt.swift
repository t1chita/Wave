//
//  RoundedCorner.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
           clipShape( RoundedCorner(radius: radius, corners: corners) )
       }
    
    func merchantModifier(merchant: Binding<Merchant?>, action: @escaping () -> Void) -> some View {
        self.modifier(MerchantCardModifier(merchant: merchant, action: action))
    }
}

