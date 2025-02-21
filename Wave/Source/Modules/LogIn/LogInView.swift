//
//  ContentView.swift
//  Wave
//
//  Created by Temur Chitashvili on 20.02.25.
//

import SwiftUI

struct LogInView: View {
    @Bindable var vm: LogInViewModel
    let socialMediaButtonsArray: [String] = ["google", "facebook", "apple"]
    var body: some View {
        ZStack {
            Color
                .myBackground
                .ignoresSafeArea()
            
            content()
        }
    }
    
    private func content() -> some View {
        VStack(spacing: 30) {
            MyNavBar()
            
            loginCard()
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    
    private func loginCard() -> some View {
        VStack(spacing: 40) {
            welcomeBack()
            
            VStack(spacing: 24) {
                loginForms()
                
                forgotPassword()
                
                buttons()
                
                divider()
                
                socialMediaButtons()
            }
        }
        .padding(.top, 30)
        .padding(.horizontal, 30)
    }
    
    private func welcomeBack() -> some View {
        VStack(spacing: 10) {
            Text("Login")
                .font(.system(size: 28, weight: .semibold))
                .foregroundStyle(.myGreen)
            
            Text("Welcome back! Please log in to access your account.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray.opacity(0.75))
                .font(.system(size: 14, weight: .regular))
        }

    }
    
    private func forgotPassword() -> some View {
        Button {
            print("Forgot Password")
        } label: {
            Text("Forgot Password?")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.white)
                .underline()
        }

    }
    
    private func loginForms() -> some View {
        VStack(spacing: 20) {
            YRBankTextField(text: $vm.email,
                            placeHolder: "Enter your email") {
                vm.isEmailValid
            }
            
            YRBankSecureTextField(text: $vm.password,
                                  placeHolder: "Enter your password") {
                vm.isPasswordValid
            }
        }
    }
    
    private func buttons() -> some View {
        VStack(spacing: 24) {
            YRBankButton(text: "Login", style: .primary) {
                print("LogIn")
            }
            
            YRBankButton(text: "Sign Up", style: .secondary) {
                print("Sign Up")
            }
        }
    }
    
    private func divider() -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 0)
                .frame(height: 1)
                .foregroundStyle(.myTeritary)
            
            Text("Or Continue With")
                .foregroundStyle(.myTeritary)
                .font(.system(size: 12, weight: .regular))
            
            RoundedRectangle(cornerRadius: 0)
                .frame(height: 1)
                .foregroundStyle(.myTeritary)
        }
    }
    
    private func socialMediaButtons() -> some View {
        HStack(spacing: 20) {
            ForEach(socialMediaButtonsArray, id: \.self) { image in
                SocialMediaButton(image: image)
            }
        }
    }
}



#Preview {
    LogInView(vm: LogInViewModel())
        .environmentObject(NavigationManager())
}
