//
//  DoubleExt.swift
//  Wave
//
//  Created by Temur Chitashvili on 21.02.25.
//

import Foundation

extension Double {
    var formattedToTwoDecimals: String {
        String(format: "%.2f", self)
    }
}
