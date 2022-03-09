//
//  GBShopTests.swift
//  GBShopTests
//
//  Created by Denis Dmitriev on 14.02.2022.
//

import XCTest
import Alamofire
@testable import GBShop

class GBShopTests: XCTestCase {
    
    var requestFactory: RequestFactory!
    let expectation = XCTestExpectation(description: "userRequests")

    override func setUpWithError() throws {
        super.setUp()
        requestFactory = RequestFactory()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        requestFactory = nil
    }
    
    func testAuth() throws {
        let auth = requestFactory.makeAuthRequestFactory()
        
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testRegister() throws {
        let register = requestFactory.makeRegisterRequestFactory()
        register.register(
            username: "Somebody",
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
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testChangeUserData() throws {
        let change = requestFactory.makeChangeUserDataRequestFactory()
        
        change.change(userId: 2, username: "Geekbrains", password: "password", email: "geekbrains@gb.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let change):
                print(change)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLogout() throws {
        let logout = requestFactory.makeLogoutRequestFactory()
        logout.logout(userId: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testCatalogRequest() throws {
        let catalog = requestFactory.makeCatalogRequestFactory()
        catalog.catalog(pageNumber: 1, categoryId: 1) { response in
            switch response.result {
            case .success(let catalog):
                print(catalog)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testProductRequest() throws {
        let productRequest = requestFactory.makeProductRequestFactory()
        productRequest.product(productId: 123) { response in
            switch response.result {
            case .success(let product):
                print(product)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

}

