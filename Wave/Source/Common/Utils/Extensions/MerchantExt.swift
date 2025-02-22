//
//  MerchantExt.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//
//
//import Foundation
//
//extension Merchant {
//    func distanceFromUser(userLocation: CLLocation) -> String {
//        let businessLocation = CLLocation(latitude: self.lat ?? 0, longitude: self.lang ?? 0)
//        let distanceInMeters = userLocation.distance(from: businessLocation)
//        
//        if distanceInMeters < 1000 {
//            return "\(Int(distanceInMeters)) m"
//        } else {
//            return String(format: "%.1f km", distanceInMeters / 1000)
//        }
//    }
//}
