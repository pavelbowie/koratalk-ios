//
//  Int+ExtensionsTests.swift
//  UtilitiesTests
//
//  Created by Pavel Mac on 29/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import XCTest

class IntExtensionsTests: XCTestCase {

    func testToString() {
        let number = 100
        XCTAssertEqual("100", number.toString)
        
        let number1 = 100_000
        XCTAssertEqual("100000", number1.toString)
    }
}
