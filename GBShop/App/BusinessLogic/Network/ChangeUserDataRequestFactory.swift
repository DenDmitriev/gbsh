//
//  ChangeUserDataRequestFactory.swift
//  GBShop
//
//  Created by Denis Dmitriev on 16.02.2022.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func change(
        userId: Int,
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping (AFDataResponse<ChangeResult>) -> Void
    )
}
