//
//  Catalog.swift
//  GBShop
//
//  Created by Denis Dmitriev on 23.02.2022.
//

import Foundation
import Alamofire

class Catalog: AbstractRequestFactory {
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

extension Catalog: CatalogRequestFactory {
    func catalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<CatalogResult>) -> Void) {
        let requestModel = Catalog(baseUrl: baseUrl, pageNumber: pageNumber, categoryId: categoryId)
        print(requestModel.fullUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Catalog {
    struct Catalog: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "catalog"
        
        let pageNumber: Int
        let categoryId: Int
        
        var parameters: Parameters? {
            return ["pageNumber": pageNumber, "categoryId": categoryId]
        }
    }
}
