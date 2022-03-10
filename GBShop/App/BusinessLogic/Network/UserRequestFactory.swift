//
//  UserRequestFactory.swift
//  GBShop
//
//  Created by Denis Dmitriev on 09.03.2022.
//

import Foundation
import Alamofire

protocol UserRequestFactory: CatalogRequestFactory, ProductRequestFactory, ReviewsRequestFactory {
    
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    func change(userId: Int, username: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeResult>) -> Void)
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
    func register(username: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void)
}
