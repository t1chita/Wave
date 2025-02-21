//
//  SignUpView.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//


import SwiftUI

struct SignUpView: View {
    @Bindable var vm: SignUpViewModel
    @EnvironmentObject var router: NavigationManager

    let socialMediaButtonsArray: [String] = ["google", "facebook", "apple"]

    var body: some View {
        ZStack {
            Color
                .myBackground
                .ignoresSafeArea()
            
            content()
        }
        .navigationBarBackButtonHidden()
    }
    
    private func content() -> some View {
        ScrollView {
            VStack(spacing: 30) {
                MyNavBar()
                
                signUpCard()
                
                Spacer()
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal)
    }
    
    private func signUpCard() -> some View {
        VStack(spacing: 40) {
            signUpGreeting()
            
            VStack(spacing: 24) {
                loginForms()
                
                buttons()
                
                divider()
                
                socialMediaButtons()
            }
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 30)
        .background(
            GeometryReader { geo in
                Image(.templateGreen)
                      .resizable()
                      .scaledToFill()
                      .frame(width: geo.size.width, height: geo.size.height)
                      .clipped()
                      .opacity(0.03)
              }
        )
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 1)
                .foregroundStyle(.myBorder)
        }
    }
    
    private func signUpGreeting() -> some View {
        VStack(spacing: 10) {
            Text("Sign Up")
                .font(.system(size: 28, weight: .semibold))
                .foregroundStyle(.myGreen)
            
            Text("Join our community today! Create an account to unlock exclusive features and personalized experiences.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray.opacity(0.75))
                .font(.system(size: 14, weight: .regular))
        }
    }
    
    
    private func loginForms() -> some View {
        VStack(spacing: 20) {
            YRBankTextField(text: $vm.name,
                            placeHolder: "Enter First Name") {
                vm.isFirstNameValid
            }
            
            YRBankTextField(text: $vm.lastName,
                                  placeHolder: "Enter Last Name") {
                vm.isLastNameValid
            }
            
            YRBankTextField(text: $vm.email,
                                  placeHolder: "Enter Your Email") {
                vm.isEmailValid
            }
            
            YRBankSecureTextField(text: $vm.password,
                                  placeHolder: "Enter Your Password") {
                vm.isPasswordValid
            }
        }
    }
    
    private func buttons() -> some View {
        VStack(spacing: 24) {
            YRBankButton(text: "Sign Up", style: vm.isFormValid ? .primary : .primaryDisabled) {
                vm.registerUser { result in
                    switch result {
                    case true:
                        router.navigate(to: .mainTabView)
                    case false:
                        //TODO: Alert
                        print("Can't Register")
                    }
                }
            }
            
            YRBankButton(text: "Login", style: .secondary) {
                router.navigateBack()
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
