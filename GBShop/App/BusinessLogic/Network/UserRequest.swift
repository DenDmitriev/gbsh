//
//  UserRequest.swift
//  GBShop
//
//  Created by Denis Dmitriev on 09.03.2022.
//

import Foundation
import Alamofire

class UserRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    var baseUrl: URL = URL(string: "https://lit-atoll-22091.herokuapp.com/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension UserRequest {
    
    struct Request: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod
        var path: String
        var parameters: Parameters?
    }
    
    private func createRequest<T: Decodable>(_ method: RequestMethod, _ completionHandler: @escaping (AFDataResponse<T>) -> Void) {
        let requestModel = Request(baseUrl: baseUrl, method: .post, path: method.path, parameters: method.parameters)
        print(requestModel.fullUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension UserRequest: UserRequestFactory {
    
    //MARK: - User data requests
    
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let method = RequestMethod.authorisation(login: userName, password: password)
        createRequest(method, completionHandler)
    }
    
    func change(userId: Int, username: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeResult>) -> Void) {
        let method = RequestMethod.change(userId: userId, login: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        createRequest(method, completionHandler)
    }
    
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let method = RequestMethod.logout(userId: userId)
        createRequest(method, completionHandler)
    }
    
    func register(username: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void) {
        let method = RequestMethod.register(login: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        createRequest(method, completionHandler)
    }
    
    //MARK: - Products requests
    
    func catalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<CatalogResult>) -> Void) {
        let method = RequestMethod.catalog(pageNumber: pageNumber, categoryId: categoryId)
        createRequest(method, completionHandler)
    }
    
    func product(productId: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void) {
        let method = RequestMethod.product(id: productId)
        createRequest(method, completionHandler)
    }
    
    
    //MARK: - Reviews requests
    
    func getReviews(productId: Int, completionHandler: @escaping (AFDataResponse<ReviewsResult>) -> Void) {
        let method = RequestMethod.getReviews(productId: productId)
        createRequest(method, completionHandler)
    }
    
    func addReview(productId: Int, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let method = RequestMethod.addReview(productId: productId)
        createRequest(method, completionHandler)
    }
    
    func deleteReview(reviewId: Int, completionHandler: @escaping (AFDataResponse<DeleteReviewResult>) -> Void) {
        let method = RequestMethod.deleteReview(reviewId: reviewId)
        createRequest(method, completionHandler)
    }
}
