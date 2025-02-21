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
            id: 1,
            name: "GreenCharge",
            description: "Charge green! GreenCharge produces chargers with recycled materials.",
            esgType: "ENV",
            esgValueRatio: "0.10",
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
}
