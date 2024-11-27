//
//  MainCategory.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct MainCategory: Decodable {
    public let id: Int
    public let name: String?
    public let recipes: [Recipe]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case recipes
    }
}
