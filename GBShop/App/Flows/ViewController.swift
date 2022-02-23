//
//  ViewController.swift
//  GBShop
//
//  Created by Denis Dmitriev on 14.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let requestFactory = RequestFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authRequest()
        registerRequest()
        changeUserDataRequest()
        logoutRequest()
    }
    
    func authRequest() {
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func registerRequest() {
        let register = requestFactory.makeRegisterRequestFactory()
        register.register(
            userId: 123,
            userName: "Somebody",
            password: "mypassword",
            email: "some@some.ru",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language"
        ) { response in
            switch response.result {
            case .success(let register):
                print(register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func changeUserDataRequest() {
        let change = requestFactory.makeChangeUserDataRequestFactory()
        change.change(
            userId: 123,
            userName: "Geekbrains",
            password: "password",
            email: "geekbrains@gb.ru",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language"
        ) { response in
            switch response.result {
            case .success(let change):
                print(change)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logoutRequest() {
        let logout = requestFactory.makeLogoutRequestFactory()
        logout.logout(userId: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
        
        

}

