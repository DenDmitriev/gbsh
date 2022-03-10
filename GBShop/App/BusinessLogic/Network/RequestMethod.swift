//
//  RequestMethod.swift
//  GBShop
//
//  Created by Denis Dmitriev on 09.03.2022.
//

import Foundation

enum RequestMethod {
    
    //MARK: User methods
    case register(login: String, password: String, email: String, gender: String, creditCard: String, bio: String)
    case authorisation(login: String, password: String)
    case change(userId: Int, login: String, password: String, email: String, gender: String, creditCard: String, bio: String)
    case logout(userId: Int)
    
    //MARK: Products methods
    case catalog(pageNumber: Int, categoryId: Int)
    case product(id: Int)
    
    //MARK: Review methods
    case getReviews(productId: Int)
    case addReview(productId: Int)
    case deleteReview(reviewId: Int)
    
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
        case .catalog:
            return "catalog"
        case .product:
            return "getproduct"
        case .getReviews:
            return "getreviews"
        case .addReview:
            return "addreview"
        case .deleteReview:
            return "deletereview"
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
        case .catalog(pageNumber: let pageNumber, categoryId: let categoryId):
            return  [
                "pageNumber": String(pageNumber),
                "categoryId": String(categoryId)
            ]
        case .product(id: let id):
            return [
                "productId": String(id)
            ]
        case .getReviews(productId: let id):
            return [
                "productId": String(id)
            ]
        case .addReview(productId: let id):
            return [
                "productId": String(id)
            ]
        case .deleteReview(reviewId: let id):
            return [
                "reviewId": String(id)
            ]
        }
    }
}
