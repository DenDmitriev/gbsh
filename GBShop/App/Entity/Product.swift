//
//  Catalog.swift
//  GBShop
//
//  Created by Denis Dmitriev on 23.02.2022.
//

import Foundation

struct Product: Codable {
    let result: Int
    let name: String
    let price: Int
    let description: String

    enum CodingKeys: String, CodingKey {
        case result = "result"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
}


