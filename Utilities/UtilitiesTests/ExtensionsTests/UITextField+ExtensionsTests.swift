//
//  UITextField+ExtensionsTests.swift
//  UtilitiesTests
//
//  Created by Pavel Mac on 29/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import XCTest
@testable import Utilities

class UITextFieldExtensionsTests: XCTestCase {
    
    func testTrimmedText() {
        let textField = UITextField()
        textField.text = " UserFirstName "
        XCTAssertEqual("UserFirstName", textField.trimmedText)
        
        textField.text = "\n\n UserFirstName " + "UserLastName\n\n"
        
        XCTAssertEqual("UserFirstName UserLastName", textField.trimmedText)
    }
}
