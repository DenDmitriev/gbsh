//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Denis Dmitriev on 16.02.2022.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
