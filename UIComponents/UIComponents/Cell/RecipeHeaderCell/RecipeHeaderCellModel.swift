//
//  RecipeHeaderCellModel.swift
//  UIComponents
//
//  Created by Pavel Mac on 1/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

public protocol RecipeHeaderCellDataSource {
    var imageUrl: String { get }
    var isEditorChoice: Bool { get }
}

public protocol RecipeHeaderCellEventSource {
    
}

public protocol RecipeHeaderCellProtocol: RecipeHeaderCellDataSource, RecipeHeaderCellEventSource {
    
}

public final class RecipeHeaderCellModel: RecipeHeaderCellProtocol {
    public var imageUrl: String
    public var isEditorChoice: Bool
    
    public init(imageUrl: String, isEditorChoice: Bool) {
        self.imageUrl = imageUrl
        self.isEditorChoice = isEditorChoice
    }
}
