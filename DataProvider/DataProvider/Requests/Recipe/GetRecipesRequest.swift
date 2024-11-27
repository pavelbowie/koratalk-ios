//
//  GetRecipesRequest.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct GetRecipesRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[Recipe]>
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public let listType: ListType
    
    public init(page: Int, listType: ListType) {
        self.parameters["page"] = page
        self.listType = listType
        switch listType {
        case .editorChoiceRecipes:
            path = "editor-choices"
        case .lastAddedRecipes:
            path = "recipe/"
        case .categoryRecipes(let categoryId):
            path = "category/\(categoryId)/recipe"
        }
    }
}

public enum ListType {
    case editorChoiceRecipes
    case lastAddedRecipes
    case categoryRecipes(categoryId: Int)
}
