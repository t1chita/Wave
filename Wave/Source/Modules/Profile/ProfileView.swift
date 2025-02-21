//
//  ProfileView.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import SwiftUI

struct ProfileView: View {
    @Bindable var vm: ProfileViewModel
    @EnvironmentObject var router: NavigationManager
    var body: some View {
        ZStack {
            Color
                .myBackground
                .ignoresSafeArea()
            Text("Profile")

        }
    }
}
