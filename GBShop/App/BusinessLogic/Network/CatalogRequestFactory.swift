//
//  CatalogRequestFactory.swift
//  GBShop
//
//  Created by Denis Dmitriev on 23.02.2022.
//

import Foundation
import Alamofire

protocol CatalogRequestFactory {
    func catalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[CatalogProduct]>) -> Void)
}
