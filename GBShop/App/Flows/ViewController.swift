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
        getReviews(by: 1) { result in
            switch result {
            case .success(let reviews):
                print(reviews)
            case .failure(let error):
                print(error)
            }
        }
        addReview(for: 1)
        deleteReview(for: 1)
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
        let request = requestFactory.makeRequestFactory()
        request.catalog(pageNumber: 0, categoryId: 0) { response in
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
        let request = requestFactory.makeRequestFactory()
        request.product(productId: productId) { response in
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
    
    func getReviews(by productId: Int, completion: (@escaping (Result<[Review], NetworkError>) -> Void)) {
        let request = requestFactory.makeRequestFactory()
        request.getReviews(productId: productId) { response in
            switch response.result {
            case .success(let result):
                guard let reviews = result.reviews else {
                    completion(.failure(NetworkError.response(message: result.errorMessage ?? "No reviews")))
                    return
                }
                completion(.success(reviews))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func addReview(for productId: Int) {
        let request = requestFactory.makeRequestFactory()
        request.addReview(productId: productId) { response in
            switch response.result {
            case .success(let addReview):
                addReview.result == 1 ? print("Review added") :  print(addReview.errorMessage ?? "Review add error")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteReview(for reviewId: Int) {
        let request = requestFactory.makeRequestFactory()
        request.deleteReview(reviewId: reviewId) { response in
            switch response.result {
            case .success(let deleteReview):
                deleteReview.result == 1 ? print("Review deleted") :  print(deleteReview.errorMessage ?? "Review delete error")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

