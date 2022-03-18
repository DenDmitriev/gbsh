//
//  User.swift
//  GBShop
//
//  Created by Denis Dmitriev on 16.02.2022.
//

import Foundation

struct User: Codable {
    let userId: Int
    let username: String
    let password: String
    let email: String
    let gender: String
    let creditCard: Int
    let bio: String
}
