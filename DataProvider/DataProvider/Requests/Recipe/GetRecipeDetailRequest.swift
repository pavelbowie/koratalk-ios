//
//  GetRecipeDetailRequest.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct GetRecipeDetailRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = RecipeDetail
    
    public var path: String = "recipe/{recipeId}"
    public var method: RequestMethod = .get
    
    public init(recipeId: Int) {
        self.path = "recipe/\(recipeId)"
    }
}
