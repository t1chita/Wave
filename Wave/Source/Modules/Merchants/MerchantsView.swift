//
//  MerchantsView.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import SwiftUI

struct MerchantsView: View {
    @Bindable var vm: MerchantsViewModel
    @EnvironmentObject var router: NavigationManager
    var body: some View {
        ZStack {
            Color
                .myBackground
                .ignoresSafeArea()
            Text("Merchants")
        }
    }
}
