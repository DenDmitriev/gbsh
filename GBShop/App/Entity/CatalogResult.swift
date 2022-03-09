//
//  CatalogResult.swift
//  GBShop
//
//  Created by Denis Dmitriev on 23.02.2022.
//

import Foundation

struct CatalogResult: Codable {
    let result: Int
    let products: [Product]?
    let errorMessage: String?
}
