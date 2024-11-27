//
//  AuthTests.swift
//  KoraTalkDataProviderTests
//
//  Created by Pavel Mac on 29/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import XCTest

class AuthTests: XCTestCase {
    
    let dataProvider = MockDataProvider()

    func testLoginRequest() throws {
        let requestExpectation = expectation(description: "requestExpectation")
        let request = LoginRequest(username: "username", password: "password")
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            requestExpectation.fulfill()
        }
        wait(for: [requestExpectation], timeout: 5)
    }
    
    func testRegisterRequest() throws {
        let requestExpectation = expectation(description: "request expectation")
        let request = RegisterRequest(username: "username", email: "username@apricus.com", password: "password")
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            requestExpectation.fulfill()
        }
        wait(for: [requestExpectation], timeout: 5)
    }
    
    func testLogoutRequest() throws {
        let requestExpectation = expectation(description: "requestExpectation")
        let request = LogoutRequest()
        dataProvider.request(for: request) { (result) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            requestExpectation.fulfill()
        }
        wait(for: [requestExpectation], timeout: 5)
    }
}
