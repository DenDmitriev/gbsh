//
//  UserRequestFactory.swift
//  GBShop
//
//  Created by Denis Dmitriev on 09.03.2022.
//

import Foundation
import Alamofire

protocol UserRequestFactory: AuthRequestFactory, ChangeUserDataRequestFactory, LogoutRequestFactory, RegisterRequestFactory {}
