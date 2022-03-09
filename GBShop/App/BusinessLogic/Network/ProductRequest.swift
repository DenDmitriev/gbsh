//
//  ProductRequest.swift
//  GBShop
//
//  Created by Denis Dmitriev on 23.02.2022.
//

import Foundation
import Alamofire

class ProductRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://lit-atoll-22091.herokuapp.com/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ProductRequest: ProductRequestFactory {
    func product(productId: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void) {
        let requestModel = ProductRequest(baseUrl: baseUrl, productId: productId)
        print(requestModel.fullUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductRequest {
    struct ProductRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getproduct"
        
        let productId: Int
        
        var parameters: Parameters? {
            return ["productId": productId]
        }
    }
}
