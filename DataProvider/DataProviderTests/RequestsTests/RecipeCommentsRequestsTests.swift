//
//  RecipeCommentsRequestsTests.swift
//  KoraTalkDataProviderTests
//
//  Created by Pavel Mac on 29/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import XCTest

class RecipeCommentsRequestsTests: XCTestCase {
    
    let dataProvider = MockDataProvider()

    func testGetRecipeCommentsRequest() throws {
        let requestExpectation = expectation(description: "requestExpectation")
        let request = GetRecipeCommentsRequest(recipeId: 1)
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
    
    func testPostRecipeCommentRequest() throws {
        let requestExpectation = expectation(description: "requestExpectation")
        let request = PostRecipeCommentRequest(recipeId: 1, commentText: "test")
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
    
    func testEditRecipeCommentRequest() throws {
        let requestExpectation = expectation(description: "requestExpectation")
        let request = EditRecipeCommentRequest(recipeId: 1, commentId: 1, commentText: "test")
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
    
    func testDeleteRecipeCommentRequest() throws {
        let requestExpectation = expectation(description: "requestExpectation")
        let request = DeleteRecipeCommentRequest(recipeId: 1, commentId: 1)
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
