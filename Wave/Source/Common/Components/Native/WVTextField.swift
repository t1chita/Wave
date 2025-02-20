//
//  RSTextFieldStyle.swift
//  Wave
//
//  Created by Temur Chitashvili on 20.02.25.
//


//
//  RSTextField.swift
//  Resilio
//
//  Created by Temur Chitashvili on 12.01.25.
//

import SwiftUI

// Enum to define text field styles
enum RSTextFieldStyle {
    case normal // Standard text field style
    case error  // Error style for invalid input
}

// Custom text field view struct
struct WVTextField: View {
    @Binding var text: String                        // The text entered by the user

    let placeHolder: String      // Placeholder text for the text field
    var isValid: () -> Bool      // Validation closure to check if the input is valid
    
    @FocusState private var isTextFieldFocused: Bool // Tracks whether the text field is focused
    @State private var hasUserTappedTextField: Bool = false // Tracks if the user has interacted with the text field
    @State private var style: RSTextFieldStyle = .normal           // The style of the text field (normal or error)
    
    var body: some View {
        TextField("",
                  text: $text,
                  prompt: Text(placeHolder).foregroundStyle(style == .error ? .red : .gray)) // TextField with placeholder
            .focused($isTextFieldFocused) // Binds focus state to track focus
            .foregroundStyle(style == .error ? .red : .black.opacity(0.87)) // Sets text color based on style
            .padding(.leading, 24) // Adds leading padding
            .padding(.vertical,16) // Adds vertical padding
            .background(
                // Background with rounded rectangle and stroke color based on state
                RoundedRectangle(cornerRadius: 4)
                    .stroke(style == .error ? .red :
                                (isTextFieldFocused ? .black.opacity(0.87) : .gray),
                            lineWidth: 1)
            )
            // Monitor changes in focus state
            .onChange(of: isTextFieldFocused) { _, newValue in
                if newValue && !hasUserTappedTextField {
                    hasUserTappedTextField = true // Mark as interacted when focused for the first time
                }
            }
            // Monitor changes in text
            .onChange(of: text) { _, newValue in
                if hasUserTappedTextField && newValue == "" {
                    style = .error // Set error style if the text field is empty after interaction
                } else {
                    style = isValid() ? .normal : .error // Update style based on validation
                }
            }
    }
}
