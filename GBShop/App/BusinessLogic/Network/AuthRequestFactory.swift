//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Denis Dmitriev on 16.02.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
