//
//  RegisterResult.swift
//  GBShop
//
//  Created by Denis Dmitriev on 16.02.2022.
//

import Foundation

struct RegisterResult: Codable {
    let result: Int
    let userMessage: String?
    let errorMessage: String?
}
