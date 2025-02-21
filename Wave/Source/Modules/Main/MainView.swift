//
//  MainView.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var router: NavigationManager
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "myNavBackground") //
        UITabBar.appearance().unselectedItemTintColor = UIColor.white.withAlphaComponent(0.5) // Non-active tab color
        
    }
    var body: some View {
        TabView {
            MerchantsView(vm: MerchantsViewModel())
                .tabItem {
                    Label("Merchants", systemImage: "leaf")
                }
            
            ProfileView(vm: ProfileViewModel())
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .accentColor(.myGreen)
        .navigationBarBackButtonHidden()
    }
}


