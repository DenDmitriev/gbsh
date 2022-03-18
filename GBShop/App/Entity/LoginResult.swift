//
//  LoginResult.swift
//  GBShop
//
//  Created by Denis Dmitriev on 16.02.2022.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User?
    let errorMessage: String?
}
