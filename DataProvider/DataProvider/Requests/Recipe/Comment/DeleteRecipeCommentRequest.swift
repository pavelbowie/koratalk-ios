//
//  DeleteRecipeCommentRequest.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct DeleteRecipeCommentRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse
    
    public var path: String = "recipe/{recipeId}/comment/{commentId}"
    public var method: RequestMethod = .delete
    
    public init(recipeId: Int, commentId: Int) {
        self.path = "recipe/\(recipeId)/comment/\(commentId)"
    }
}
