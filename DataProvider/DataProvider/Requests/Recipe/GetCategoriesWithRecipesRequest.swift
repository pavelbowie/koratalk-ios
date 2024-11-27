//
//  GetCategoriesWithRecipesRequest.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct GetCategoriesWithRecipesRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = BaseResponse<[MainCategory]>

    public var path: String = "category-recipes"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(page: Int) {
        parameters["page"] = page
    }
}
