//
//  SocialMediaButton.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import SwiftUI

struct SocialMediaButton: View {
    let image: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.myGreen.opacity(0), .myGreen.opacity(0.1)], startPoint: .bottom, endPoint: .top)
                )
                .frame(width: 68, height: 68)
                .overlay {
                    Circle()
                        .fill(
                            Color.myNavBackground.opacity(0.3)
                        )
                }
            
            Circle()
                .fill(
                    LinearGradient(colors: [.myGreen.opacity(0), .myGreen.opacity(0.1)], startPoint: .bottom, endPoint: .top)
                )
                .overlay {
                    Circle()
                        .fill(
                            Color.myNavBackground.opacity(0.3)
                        )
                }
                .frame(width: 52, height: 52)
            
            Image(image)
                .resizable()
                .frame(width: 24, height: 24)
        }
    }
}
