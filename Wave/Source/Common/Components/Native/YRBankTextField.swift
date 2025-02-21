//
//  RSTextFieldStyle.swift
//  Wave
//
//  Created by Temur Chitashvili on 20.02.25.
//

import SwiftUI

enum RSTextFieldStyle {
    case normal
    case error
}

// Custom text field view struct
struct YRBankTextField: View {
    @Binding var text: String
    let placeHolder: String
    var isValid: () -> Bool
    
    @FocusState private var isTextFieldFocused: Bool
    @State private var hasUserTappedTextField: Bool = false
    @State private var style: RSTextFieldStyle = .normal
    
    var body: some View {
        TextField("",
                  text: $text,
                  prompt: Text(placeHolder).foregroundStyle(style == .error ? .red : .myTeritary))
        .focused($isTextFieldFocused)
        .foregroundStyle(style == .error ? .red : .white)
        .padding(.leading, 16)
        .padding(.vertical,16)
        .background(
            Capsule()
                .foregroundStyle(.myNavBackground)
        )
        .overlay (
            Capsule()
                .stroke(style == .error ? .red :
                            (isTextFieldFocused ? .myGreen : .myBorder),
                        lineWidth: 1)
        )
        .onChange(of: isTextFieldFocused) { _, newValue in
            if newValue && !hasUserTappedTextField {
                hasUserTappedTextField = true
            }
        }
        .onChange(of: text) { _, newValue in
            if hasUserTappedTextField && newValue == "" {
                style = .error
            } else {
                style = isValid() ? .normal : .error
            }
        }
    }
}

// Custom text field view struct
struct YRBankSecureTextField: View {
    @Binding var text: String
    let placeHolder: String
    var isValid: () -> Bool

    @FocusState private var isTextFieldFocused: Bool
    @State private var hasUserTappedTextField: Bool = false
    @State private var isPasswordVisible: Bool = false  // State to toggle password visibility
    @State private var style: RSTextFieldStyle = .normal

    var body: some View {
        HStack {
            if isPasswordVisible {
                TextField("",
                          text: $text,
                          prompt: Text(placeHolder).foregroundStyle(style == .error ? .red : .myTeritary))
                .focused($isTextFieldFocused)
                .foregroundStyle(style == .error ? .red : .white)
            } else {
                SecureField("",
                            text: $text,
                            prompt: Text(placeHolder).foregroundStyle(style == .error ? .red : .myTeritary))
                .focused($isTextFieldFocused)
                .foregroundStyle(style == .error ? .red : .white)
            }
            
            Spacer()
            
            Button(action: {
                isPasswordVisible.toggle()  // Toggle the password visibility
            }) {
                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")  // Change icon based on visibility
                    .foregroundColor(.myTeritary)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical,16)
        .background(
            Capsule()
                .foregroundStyle(.myNavBackground)
        )
        .overlay (
            Capsule()
                .stroke(style == .error ? .red :
                    (isTextFieldFocused ? .myGreen : .myBorder),lineWidth: 1)
        )
        .onChange(of: isTextFieldFocused) { _, newValue in
            if newValue && !hasUserTappedTextField {
                hasUserTappedTextField = true
            }
        }
        .onChange(of: text) { _, newValue in
            if hasUserTappedTextField && newValue == "" {
                style = .error
            } else {
                style = isValid() ? .normal : .error
            }
        }
    }
}
