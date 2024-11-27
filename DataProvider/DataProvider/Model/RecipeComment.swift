//
//  RecipeComment.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct RecipeComment: Decodable {
    public let id: Int
    public let text: String?
    public let timeDifference: String?
    public let user: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case timeDifference = "difference"
        case user
    }
}
