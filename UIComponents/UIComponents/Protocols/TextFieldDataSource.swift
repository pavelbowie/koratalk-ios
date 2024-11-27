//
//  TextFieldDataSource.swift
//  UIComponents
//
//  Created by Pavel Mac on 4/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

public protocol TextFieldDataSource {
    var placeholder: String? { get }
    var keyboardType: UIKeyboardType { get }
    var textContentType: UITextContentType? { get }
    var autocapitalizationType: UITextAutocapitalizationType { get }
    var isSecureTextEntry: Bool { get }
}

public extension UITextField {
    
    func set(dataSource: TextFieldDataSource) {
        placeholder = dataSource.placeholder
        keyboardType = dataSource.keyboardType
        textContentType = dataSource.textContentType
        autocapitalizationType = dataSource.autocapitalizationType
        isSecureTextEntry = dataSource.isSecureTextEntry
    }
}
