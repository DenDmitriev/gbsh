//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by Denis Dmitriev on 23.02.2022.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    func product(productId: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
}
