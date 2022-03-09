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
    
    enum Method {
        case register(login: String, password: String, email: String, gender: String, creditCard: String, bio: String)
        case authorisation(login: String, password: String)
        case change(userId: Int, login: String, password: String, email: String, gender: String, creditCard: String, bio: String)
        case logout(userId: Int)
        
        var path: String {
            switch self {
            case .register:
                return "register"
            case .authorisation:
                return "authorization"
            case .change:
                return "change"
            case .logout:
                return "logout"
            }
        }
        
        var parameters: [String: String] {
            switch self {
            case .register(login: let login, password: let password, email: let email, gender: let gender, creditCard: let creditCard, bio: let bio) :
                return [
                    "username": login,
                    "password": password,
                    "email": email,
                    "gender": gender,
                    "creditCard": creditCard,
                    "bio": bio
                ]
            case .authorisation(login: let login, password: let password):
                return [
                    "login": login,
                    "password": password
                ]
            case .change(userId: let userId, login: let login, password: let password, email: let email, gender: let gender, creditCard: let creditCard, bio: let bio):
                return [
                    "userId": String(userId),
                    "username": login,
                    "password": password,
                    "email": email,
                    "gender": gender,
                    "creditCard": creditCard,
                    "bio": bio
                ]
            case .logout(userId: let userId):
                return [
                    "userId": String(userId)
                ]
            }
        }
    }
}

extension UserRequest: UserRequestFactory {
    
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let method = Method.authorisation(login: userName, password: password)
        let requestModel = Request(baseUrl: baseUrl, method: .post, path: method.path, parameters: method.parameters)
        print(requestModel.fullUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func change(userId: Int, username: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeResult>) -> Void) {
        let method = Method.change(userId: userId, login: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        let requestModel = Request(baseUrl: baseUrl, method: .post, path: method.path, parameters: method.parameters)
        print(requestModel.fullUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let method = Method.logout(userId: userId)
        let requestModel = Request(baseUrl: baseUrl, method: .post, path: method.path, parameters: method.parameters)
        print(requestModel.fullUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func register(username: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void) {
        let method = Method.register(login: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        let requestModel = Request(baseUrl: baseUrl, method: .post, path: method.path, parameters: method.parameters)
        print(requestModel.fullUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension UserRequest {
    
    struct Request: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod
        var path: String
        var parameters: Parameters?
    }
}
