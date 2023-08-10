//
//  Order.swift
//  Tutorial
//
//  Created by Sange Sherpa on 07/08/2023.
//

import Foundation
import UIKit

struct Order {
    var orderImage: UIImage?
    var orderedBy: String
    var orderedFrom: String
    var orderDate: String
    var orderTime: String
    var orderPrice: String
}

struct Booking {
    var bookingImage: UIImage?
    var orderedBy: String
    var orderDesc: String
    var orderDate: String
    var orderTime: String
    var statusButton: UIButton
}
