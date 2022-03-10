//
//  ReviewsResult.swift
//  GBShop
//
//  Created by Denis Dmitriev on 10.03.2022.
//

import Foundation

struct ReviewsResult: Codable {
    let result: Int
    let reviews: [Review]?
    let errorMessage: String?
}
