//
//  NetworkError.swift
//  GBShop
//
//  Created by Denis Dmitriev on 09.03.2022.
//

import Foundation

enum NetworkError: Error {
    case response(message: String)
}
