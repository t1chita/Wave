//
//  MerchantsViewModel.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation

@Observable
final class MerchantsViewModel {
    let merchants: [Merchant] = [
        Merchant(
            name: "GreenCharge",
            category: "ESG: Environment",
            esgValue: "0.1",
            description: "Charge green! GreenCharge produces chargers with recycled materials. Collect ESGC and buy merchandise with your hard-earned coins!"
        ),
        Merchant(
            name: "EVCharge",
            category: "ESG: Environment",
            esgValue: "0.1",
            description: "Ride green! EVCharge is an electric vehicle charging station, which lets you collect ESGC for every kW of energy. Collect ESGC and buy merchandise with your hard-earned coins!"
        ),
        Merchant(
            name: "AdapTech",
            category: "ESG: Social",
            esgValue: "0.15",
            description: "Play equal! AdapTech produces hardware that lets those struggling with disabilities to game with us. Collect ESGC and buy merchandise with your hard-earned coins!"
        )
    ]
}
