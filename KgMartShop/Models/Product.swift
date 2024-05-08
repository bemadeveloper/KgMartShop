//
//  Product.swift
//  KgMartShop
//
//  Created by Bema on 6/5/24.
//

import Foundation
import UIKit

struct Products {
    var id = UUID()
    var name: String
    var image: UIImage
    var price: Float16
    var description: String?
    var brand: String
    var manufacturer: String
}
