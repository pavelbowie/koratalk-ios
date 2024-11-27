//
//  RecipeCellModel.swift
//  UIComponents
//
//  Created by Pavel Mac on 24/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

public protocol RecipeCellDataSource: AnyObject {
    var recipeId: Int { get }
    var userId: Int { get }
    var userImageUrl: String? { get }
    var username: String? { get }
    var userRecipeAndFollowerCountText: String? { get }
    var recipeTitle: String? { get }
    var categoryName: String? { get }
    var recipeImageUrl: String? { get }
    var recipeCommentAndLikeCountText: String? { get }
    var isEditorChoice: Bool { get }
}

public protocol RecipeCellEventSource: AnyObject {
    var followButtonTapped: VoidClosure? { get set }
}

public protocol RecipeCellProtocol: RecipeCellDataSource, RecipeCellEventSource {}

public class RecipeCellModel: RecipeCellProtocol {
    public var recipeId: Int
    public var userId: Int
    public var userImageUrl: String?
    public var username: String?
    public var userRecipeAndFollowerCountText: String?
    public var recipeTitle: String?
    public var categoryName: String?
    public var recipeImageUrl: String?
    public var recipeCommentAndLikeCountText: String?
    public var isEditorChoice = false
    public var followButtonTapped: VoidClosure?
    
    public init(recipeId: Int,
                userId: Int,
                userImageUrl: String?,
                username: String?,
                userRecipeAndFollowerCountText: String?,
                recipeTitle: String?, categoryName: String?,
                recipeImageUrl: String?,
                recipeCommentAndLikeCountText: String?,
                isEditorChoice: Bool) {
        self.recipeId = recipeId
        self.userId = userId
        self.userImageUrl = userImageUrl
        self.username = username
        self.userRecipeAndFollowerCountText = userRecipeAndFollowerCountText
        self.recipeTitle = recipeTitle
        self.categoryName = categoryName
        self.recipeImageUrl = recipeImageUrl
        self.recipeCommentAndLikeCountText = recipeCommentAndLikeCountText
        self.isEditorChoice = isEditorChoice
    }
}
