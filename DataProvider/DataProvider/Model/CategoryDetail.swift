//
//  CategoryDetail.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct CategoryDetail: Decodable {
    public let id: Int
    public let name: String?
    public let mainCategoryId: Int?
    public let imageUrl: Image?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case mainCategoryId = "main_category_id"
        case imageUrl = "image"
    }
}
