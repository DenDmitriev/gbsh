//
//  Product.swift
//  GBShop
//
//  Created by Denis Dmitriev on 09.03.2022.
//

import Foundation

struct Product: Codable {
    var id: Int
    var category: Int
    var name: String
    var price: Int
    var description: String
}
