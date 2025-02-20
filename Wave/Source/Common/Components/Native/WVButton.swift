//
//  WVButton.swift
//  Wave
//
//  Created by Temur Chitashvili on 20.02.25.
//

import SwiftUI

// MARK: - Enum to define button styles
enum ButtonStyle {
    case primary
    case primaryDisabled
}

// MARK: - Custom Button
struct WVButton: View {
    let buttonText: String   // Button label text
    let buttonStyle: ButtonStyle // Button style (primary or disabled)
    let action: () -> Void   // Action when tapped
    
    init (
        buttonText: String,
        buttonStyle: ButtonStyle,
        action: @escaping () -> Void
    ) {
        self.buttonText = buttonText
        self.buttonStyle = buttonStyle
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .foregroundColor(foregroundColor) // Text color
                .font(.system(size: fontSize, weight: fontWeight))
                .padding(.vertical, verticalPadding)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)) // Updated background color
        }
        .disabled(isDisabled)
    }
    
    // MARK: - Button Style Properties
    
    private var verticalPadding: CGFloat { 12 }
    private var cornerRadius: CGFloat { 8 }
    private var fontSize: CGFloat { 16 }
    private var fontWeight: Font.Weight { .semibold }
    
    // Background Color Based on Button Style
    private var backgroundColor: Color {
        switch buttonStyle {
        case .primary:
            return Color.blue // Updated primary color
        case .primaryDisabled:
            return Color.gray.opacity(0.5) // Updated disabled color
        }
    }
    
    private var foregroundColor: Color {
        switch buttonStyle {
        case .primary:
            return Color.white // Updated primary color
        case .primaryDisabled:
            return Color.gray // Updated disabled color
        }
    }
    
    // Check if Button is Disabled
    private var isDisabled: Bool {
        buttonStyle == .primaryDisabled
    }
}
