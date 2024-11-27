//
//  PostRecipeCommentRequest.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct PostRecipeCommentRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = RecipeComment

    public var path: String = "recipe/{recipeId}/comment"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(recipeId: Int, commentText: String) {
        self.path = "recipe/\(recipeId)/comment"
        self.parameters["text"] = commentText
    }
}
