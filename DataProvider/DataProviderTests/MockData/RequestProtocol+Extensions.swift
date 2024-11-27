//
//  RequestProtocol+Extensions.swift
//  KoraTalkDataProviderTests
//
//  Created by Pavel Mac on 29/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

extension RequestProtocol {
    
    var mockFileName: String {
        switch self {
        case is GetRecipesRequest:
            switch (self as? GetRecipesRequest)?.listType {
            case .lastAddedRecipes:
                return "GetLastAddedRecipesRequest"
            case .editorChoiceRecipes:
                return "GetEditorChoiceRecipesRequest"
            case .categoryRecipes:
                return "GetCategoryRecipesRequest"
            case .none:
                break
            }
        case is RecipeLikeRequest:
            switch (self as? RecipeLikeRequest)?.likeType {
            case .like:
                return "RecipeLikeRequest"
            case .unlike:
                return "RecipeUnlikeRequest"
            case .none:
                break
            }
        default:
            return String(describing: Self.self)
        }
        return String(describing: Self.self)
    }
}
