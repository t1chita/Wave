//
//  YRBankButton.swift
//  Wave
//
//  Created by Temur Chitashvili on 20.02.25.
//

import SwiftUI


enum ButtonStyle {
    case primary
    case primaryDisabled
    case secondary
    case secondaryDisabled
}

struct YRBankButton: View {
    let text: String
    var style: ButtonStyle
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundStyle(foregroundStyle)
                .font(.system(size: 14, weight: .regular))
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 14)
        .background(
            Capsule()
                .foregroundStyle(backgroundStyle)
        )
        .disabled(isDisabled)
        .overlay {
            if style == .secondary || style == .secondaryDisabled {
                Capsule()
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.myButtonBorder)
            }
        }
    }
    
    var foregroundStyle: Color {
        switch style {
        case .primary:
            return .myNavBackground
        case .primaryDisabled:
            return .white.opacity(0.8)
        case .secondary:
            return .white
        case .secondaryDisabled:
            return .white.opacity(0.5)
        }
    }
    
    var backgroundStyle: Color {
        switch style {
        case .primary:
            return .myGreen
        case .primaryDisabled:
            return .myGreen.opacity(0.5)
        case .secondary:
            return .myBorder
        case .secondaryDisabled:
            return .myBorder.opacity(0.5)
        }
    }
    
    var isDisabled: Bool {
        switch style {
        case .primary, .secondary:
            false
        case .primaryDisabled, .secondaryDisabled:
            true        }
    }
}

#Preview {
    VStack(spacing: 16) {
        YRBankButton(text: "Primary Button", style: .primary) {
            print("Primary Button Pressed")
        }
        
        YRBankButton(text: "Disabled Button", style: .primaryDisabled) {
            print("Disabled Button Pressed")
        }
        YRBankButton(text: "Secondary Button", style: .secondary) {
            print("Disabled Button Pressed")
        }
        YRBankButton(text: "Secondary Disabled Button", style: .secondaryDisabled) {
            print("Disabled Button Pressed")
        }
    }
}
