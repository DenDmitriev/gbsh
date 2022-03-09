//
//  Change.swift
//  GBShop
//
//  Created by Denis Dmitriev on 16.02.2022.
//

import Foundation
import Alamofire

class Change: AbstractRequestFactory {
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

extension Change: ChangeUserDataRequestFactory {
    func change(userId: Int, username: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeResult>) -> Void) {
        let requestModel = Change(baseUrl: baseUrl, userId: userId, login: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        print(requestModel.fullUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Change {
    struct Change: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "change"
        
        let userId: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return [
                "userId": userId,
                "username": login,
                "password": password,
                "email": email,
                "gender": gender,
                "creditCard": creditCard,
                "bio": bio
            ]
        }
    }
}
