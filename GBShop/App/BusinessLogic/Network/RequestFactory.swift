//
//  RequestFactory.swift
//  GBShop
//
//  Created by Denis Dmitriev on 16.02.2022.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeRequestFactory() -> UserRequestFactory {
        let errorParser = makeErrorParser()
        return UserRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
