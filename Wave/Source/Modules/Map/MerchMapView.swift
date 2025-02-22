//
//  MapView.swift
//  Wave
//
//  Created by Temur Chitashvili on 22.02.25.
//

import SwiftUI
import MapKit

struct MerchMapView: View {
    @Bindable var vm: MerchMapViewModel
    @EnvironmentObject var merchantsManager: MerchantsManager
    @Namespace private var mapScope
    @State private var showActionSheet = false
    @State var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        map()
            .ignoresSafeArea()
            .toolbar(.hidden, for: .navigationBar)
            .onChange(of: vm.selectedMerchant) { newMerchant in
                if let merchant = newMerchant {
                    centerCamera(on: merchant)
                }
            }
            .merchantModifier(merchant: $vm.selectedMerchant) {
                showActionSheet = true
            }
            .confirmationDialog("Open in Maps", isPresented: $showActionSheet, titleVisibility: .visible) {
                Button("Open in Apple Maps") {
                    openInAppleMaps()
                }
                Button("Open in Google Maps") {
                    openInGoogleMaps()
                }
                Button("Cancel", role: .cancel) { }
            }
    }
    
    private func map() -> some View {
        Map(position: $cameraPosition, selection: $vm.selectedMerchant, scope: mapScope) {
            UserAnnotation()
            // For each business, create a Marker
            ForEach(merchantsManager.merchants) { merchant in
                Annotation(
                    coordinate: CLLocationCoordinate2D(
                        latitude: merchant.latitudeDouble ?? 0,
                        longitude: merchant.longitudeDouble ?? 0
                    ),
                    content: {
                        Image(.lama)
                            .resizable()
                            .frame(width: 70, height: 40)
                            .scaleEffect(vm.selectedMerchant == merchant ? 1.8 : 1.0)
                            .animation(
                                .spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5), // Bouncy animation
                                value: vm.selectedMerchant
                            )
                    },
                    label: {
                        Text(merchant.name)
                            .font(.caption)
                    }
                )
                .tag(merchant)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private func centerCamera(on merchant: Merchant) {
        withAnimation {
            cameraPosition = .camera(
                MapCamera(
                    centerCoordinate: CLLocationCoordinate2D(latitude: merchant.latitudeDouble ?? 0, longitude: merchant.longitudeDouble ?? 0),
                    distance: 5000 // Adjust the distance/zoom level as needed
                )
            )
        }
    }
    
    // 📍 Open Apple Maps
    private func openInAppleMaps() {
        let coordinate = "\(vm.selectedMerchant?.latitudeDouble ?? 0),\(vm.selectedMerchant?.longitudeDouble ?? 0)"
        if let url = URL(string: "http://maps.apple.com/?q=\(coordinate)") {
            UIApplication.shared.open(url)
        }
    }
    
    // 📍 Open Google Maps
    private func openInGoogleMaps() {
        let coordinate = "\(vm.selectedMerchant?.latitudeDouble ?? 0),\(vm.selectedMerchant?.longitudeDouble ?? 0)"
        if let url = URL(string: "comgooglemaps://?q=\(coordinate)"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else if let webURL = URL(string: "https://www.google.com/maps/search/?api=1&query=\(coordinate)") {
            UIApplication.shared.open(webURL)
        }
    }
}




