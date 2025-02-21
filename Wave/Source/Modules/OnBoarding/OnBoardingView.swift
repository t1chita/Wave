//
//  OnBoardingView.swift
//  Wave
//
//  Created by Temur Chitashvili on 20.02.25.
//

import SwiftUI

struct OnBoardingView: View {
    @Bindable var vm: OnBoardingViewModel
    @AppStorage(UserDefaults.Keys.APP_SHOWED_ONBOARDING) var showedOnBoarding: Bool = false
    var body: some View {
        ZStack {
            Color
                .myBackground
                .ignoresSafeArea()
            
            content()
        }
        .scrollIndicators(.hidden)
    }
    
    private func content() -> some View {
        ScrollView {
            VStack(spacing: 50) {
                MyNavBar()
                
                VStack(spacing: 55) {
                    VStack(spacing: 30) {
                        VStack(spacing: 12) {
                            describeCreditCheckAndLLC()
                            
                            welcomingText()
                        }
                        
                        YRBankButton(text: "Open Account", style: .primary) {
                            showedOnBoarding = true
                        }
                        .frame(width: 144)
                    }
                    
                    examplesView()
                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
    
    private func describeCreditCheckAndLLC() -> some View {
        HStack(spacing: 4) {
            Image(.verify)
                .resizable()
                .frame(width: 20, height: 20)
            
            Text("No LLC Required, No Credit Check")
                .foregroundStyle(.white)
                .font(.system(size: 12, weight: .regular))
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 60)
                .foregroundStyle(.myNavBackground)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 60)
                .stroke(lineWidth: 1)
                .foregroundStyle(.myBorder)
        }
    }
    
    private func welcomingText() -> some View {
        VStack(spacing: 8) {
            (
                Text("Welcome to YourBank Empowering Your\n")
                    .foregroundStyle(.white)
            +
                Text("Financial Journey")
                    .foregroundStyle(.myGreen)
            )
            .font(.system(size: 28, weight: .semibold))
            .multilineTextAlignment(.center)
            
            Text("At YourBank, our mission is to provide comprehensive banking solutions that empower individuals and businesses to achieve their financial goals. We are committed to delivering personalized and innovative services that prioritize our customers' needs.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .regular))
        }
    }
    
    private func examplesView() -> some View {
        VStack(spacing: 26) {
            VStack(spacing: 10) {
                HStack {
                    Text("Visit ESG merchants, win prices and more!")
                        .foregroundStyle(.white)
                        .font(.system(size: 10, weight: .semibold))
             
                    Spacer()
                }
                
                VStack(spacing: -10) {
                    ForEach(Array(vm.transactions.enumerated()), id: \.element.id) { index, transaction in
                        TransactionCell(transaction: transaction)
                            .frame(width: index == 1 ? 270 : index == 2 ? 260 : 290) // Adjust width dynamically
                            .zIndex(Double(vm.transactions.count - index)) // Ensures first appears on top
                            .opacity(index == 1 ? 0.7 : index == 2 ? 0.5 : 1) // Adjust width dynamically

                    }
                }
            }
            
            Image(.esg)
                .cornerRadius(6)
        }
        .frame(maxWidth: .infinity)
        .padding(21)
        .background(
            GeometryReader { geo in
                Image(.cardBackground)
                      .resizable()
                      .scaledToFill()
                      .frame(width: geo.size.width, height: geo.size.height)
                      .clipped()
              }
        )
        .overlay {
            RoundedRectangle(cornerRadius: 6)
                .stroke(lineWidth: 0.5)
                .fill(
                    LinearGradient(colors: [.myBorder,
                                            .myGreen.opacity(0.7),
                                            .myGreen,
                                            .myBorder,
                                            .myGreen.opacity(0.7)],
                                   startPoint: .top,
                                   endPoint: .bottom)
                )
            
        }
        .padding(.horizontal, 26)
        .overlay(alignment: .topLeading) {
            newButton()
                .offset(y: -25)
        }
    }
    
    private func newButton() -> some View {
        Button {
            print("New")
        } label: {
            HStack {
                HStack {
                    Image(.plusButton)
                        .resizable()
                        .frame(width: 22, height: 22)
                    
                    Text("New!")
                        .font(.system(size: 10, weight: .regular))
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundStyle(.mySecondBackground)
                )

                Spacer()
            }
        }
    }
}


