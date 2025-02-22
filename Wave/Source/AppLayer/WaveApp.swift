//
//  WaveApp.swift
//  Wave
//
//  Created by Temur Chitashvili on 20.02.25.
//

import SwiftUI

@main
struct WaveApp: App {
    @StateObject var router: NavigationManager = NavigationManager()
    @AppStorage(UserDefaults.Keys.APP_SHOWED_ONBOARDING) var showedOnBoarding: Bool = false
    @StateObject var merchantsManager: MerchantsManager = MerchantsManager()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                Group {
                    if showedOnBoarding {
                        LogInView(vm: LogInViewModel())
                    } else {
                        OnBoardingView(vm: OnBoardingViewModel())
                    }
                }
                .navigationDestination(for: NavigationManager.Destination.self) { destination in
                    switch destination {
                    case .signUp:
                        SignUpView(vm: SignUpViewModel())
                    case .mainTabView:
                        MainView()
                    case .merchantDetails(let merchant):
                        MerchantsDetailView(vm: MerchantsDetailViewModel(merchant: merchant))
                    }
                }
            }
            .environmentObject(router)
            .environmentObject(merchantsManager)
        }
    }
}
