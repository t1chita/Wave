//
//  MyNavBar.swift
//  Wave
//
//  Created by Temur Chitashvili on 20.02.25.
//

import SwiftUI

struct MyNavBar: View {
    let text: String?
    
    init(
        text: String? = nil
    ) {
        self.text = text
    }
    
    var body: some View {
        HStack(spacing: 4) {
            Image(.myAppIcon)
                .resizable()
                .frame(width: 26, height: 26)
            
            Text("YourBanK")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.white)
            
            Spacer()
            
            if let text = text {
                Text(text)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.white)
            }
            
            Button {
                print("Do Something")
            } label: {
                Image(.threeLine)
                    .resizable()
                    .frame(width: 28, height: 28)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 82)
                            .foregroundStyle(.myGreen)
                    )
            }
        }
        .padding(.leading, 24)
        .padding(.trailing, 14)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 100)
                .foregroundStyle(.myNavBackground)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 100)
                .stroke(lineWidth: 1)
                .foregroundStyle(.myBorder)
        }
    }
}


