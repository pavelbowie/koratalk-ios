//
//  String+ExtensionsTests.swift
//  UtilitiesTests
//
//  Created by Pavel Mac on 29/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import XCTest
@testable import Utilities

class StringExtensionsTests: XCTestCase {
    
    func testTrim() {
        var string = " UserFirstName "
        XCTAssertEqual("UserFirstName", string.trim)
        
        string = "\n\n UserFirstName " + "UserLastName\n\n"
        
        XCTAssertEqual("UserFirstName UserLastName", string.trim)
    }
}
