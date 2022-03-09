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
        
        authRequest { result in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                print(error)
            }
        }
        registerRequest { result in
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error)
            }
        }
        changeUserDataRequest { result in
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error)
            }
        }
        logoutRequest()
        getCatalog { result in
            switch result {
            case .success(let products):
                print(products)
            case .failure(let error):
                print(error)
            }
        }
        getProduct(by: 123) { result in
            switch result {
            case .success(let product):
                print(product)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    func authRequest(completion: @escaping ((Result<User, NetworkError>) -> Void)) {
        let request = requestFactory.makeRequestFactory()
        request.login(userName: "admin", password: "admin") { response in
            switch response.result {
            case .success(let login):
                guard let user = login.user else {
                    completion(.failure(NetworkError.response(message: login.errorMessage ?? "Unknown error")))
                    return
                }
                completion(.success(user))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func registerRequest(completion: @escaping ((Result<String, NetworkError>) -> Void)) {
        let request = requestFactory.makeRequestFactory()
        request.register(username: "Somebody", password: "password", email: "some@some.ru", gender: "m", creditCard: "98723892424234224234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let register):
                register.result == 1 ? completion(.success(register.userMessage ?? String())) : completion(.failure(NetworkError.response(message: register.errorMessage ?? "Unknown error")))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func changeUserDataRequest(completion: @escaping ((Result<String, NetworkError>) -> Void)) {
        let request = requestFactory.makeRequestFactory()
        request.change(userId: 2, username: "Somebody", password: "password", email: "some@some.ru", gender: "m", creditCard: "98723892424234224234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let change):
                change.result == 1 ? completion(.success(change.userMessage ?? String())) : completion(.failure(NetworkError.response(message: change.errorMessage ?? "Unknown error")))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logoutRequest() {
        let request = requestFactory.makeRequestFactory()
        request.logout(userId: 123) { response in
            switch response.result {
            case .success(let logout):
                logout.result == 1 ? print("Logged out") :  print("Unknown error")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCatalog(completion: @escaping ((Result<[Product], NetworkError>) -> Void)) {
        let catalog = requestFactory.makeCatalogRequestFactory()
        catalog.catalog(pageNumber: 0, categoryId: 0) { response in
            switch response.result {
            case .success(let catalog):
                guard let products = catalog.products else {
                    completion(.failure(NetworkError.response(message: catalog.errorMessage ?? "Unknown error")))
                    return
                }
                completion(.success(products))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getProduct(by productId: Int, completion: (@escaping (Result<Product, NetworkError>) -> Void)) {
        let productRequest = requestFactory.makeProductRequestFactory()
        productRequest.product(productId: productId) { response in
            switch response.result {
            case .success(let item):
                guard let product = item.product else {
                    completion(.failure(NetworkError.response(message: "No products")))
                    return
                }
                completion(.success(product))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

