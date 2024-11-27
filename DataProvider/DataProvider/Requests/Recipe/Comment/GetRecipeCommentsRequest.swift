//
//  GetRecipeCommentsRequest.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 9/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct GetRecipeCommentsRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[RecipeComment]>
    
    public var path: String = "recipe/{recipeId}/comment"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(recipeId: Int, page: Int? = 1) {
        self.path = "recipe/\(recipeId)/comment"
        self.parameters["page"] = page
    }
}
