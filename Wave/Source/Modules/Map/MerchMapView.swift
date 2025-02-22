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
            ForEach(vm.mockMerchants) { merchant in
                Annotation(
                    coordinate: CLLocationCoordinate2D(
                        latitude: merchant.lat ?? 0,
                        longitude: merchant.lang ?? 0
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
                    centerCoordinate: CLLocationCoordinate2D(latitude: merchant.lat ?? 0, longitude: merchant.lang ?? 0),
                    distance: 5000 // Adjust the distance/zoom level as needed
                )
            )
        }
    }
    
    
     // 📍 Open Apple Maps
     private func openInAppleMaps() {
         let coordinate = "\(vm.selectedMerchant?.lat ?? 0),\(vm.selectedMerchant?.lang ?? 0)"
         if let url = URL(string: "http://maps.apple.com/?q=\(coordinate)") {
             UIApplication.shared.open(url)
         }
     }

     // 📍 Open Google Maps
     private func openInGoogleMaps() {
         let coordinate = "\(vm.selectedMerchant?.lat ?? 0),\(vm.selectedMerchant?.lang ?? 0)"
         if let url = URL(string: "comgooglemaps://?q=\(coordinate)"),
            UIApplication.shared.canOpenURL(url) {
             UIApplication.shared.open(url)
         } else if let webURL = URL(string: "https://www.google.com/maps/search/?api=1&query=\(coordinate)") {
             UIApplication.shared.open(webURL)
     }
 }
}

@Observable
final class MerchMapViewModel {
    let mockMerchants: [Merchant] = [
        Merchant(
            id: 1,
            name: "GreenCharge",
            description: "Charge green! GreenCharge produces chargers with recycled materials.",
            esgType: "ENV",
            esgValueRatio: "0.10",
            lang: 44.7925, // Tbilisi longitude
            lat: 41.7151, // Tbilisi latitude
            products: [
                Product(
                    id: 1,
                    name: "1M Charging Cable",
                    description: "Our newest model",
                    esgCoinsPrice: "30.00",
                    picture: "http://ec1-ec2-lb-nginx-1937007172.eu-central-1.elb.amazonaws.com/media/product_images/backiee-88600.jpg",
                    available: true,
                    merchantName: "GreenCharge",
                    merchant: 1
                ),
                Product(
                    id: 2,
                    name: "2M Charging Cable",
                    description: "Our advanced model",
                    esgCoinsPrice: "50.00",
                    picture: "http://ec1-ec2-lb-nginx-1937007172.eu-central-1.elb.amazonaws.com/media/product_images/backiee-55009.jpg",
                    available: true,
                    merchantName: "GreenCharge",
                    merchant: 1
                )
            ]
        ),
        Merchant(
            id: 2,
            name: "AdapTech",
            description: "Play equal! AdapTech produces hardware, that lets those struggling to game with us.",
            esgType: "SOC",
            esgValueRatio: "0.04",
            lang: 44.8005, // Tbilisi longitude
            lat: 41.7205, // Tbilisi latitude
            products: [
                Product(
                    id: 3,
                    name: "Test Product",
                    description: "Test description",
                    esgCoinsPrice: "14.00",
                    picture: "http://ec1-ec2-lb-nginx-1937007172.eu-central-1.elb.amazonaws.com/media/product_images/backiee-91606.jpg",
                    available: true,
                    merchantName: "AdapTech",
                    merchant: 2
                ),
                Product(
                    id: 4,
                    name: "Example",
                    description: "asdfgkjghgbfvguibjnlg",
                    esgCoinsPrice: "2.00",
                    picture: "http://ec1-ec2-lb-nginx-1937007172.eu-central-1.elb.amazonaws.com/media/product_images/backiee-43128.jpg",
                    available: true,
                    merchantName: "AdapTech",
                    merchant: 2
                )
            ]
        )
    ]
    
    var selectedMerchant: Merchant?
}

#Preview {
    MerchMapView(vm: MerchMapViewModel())
}


