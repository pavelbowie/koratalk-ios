//
//  Pagination.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct Pagination: Decodable {
    public let currentPage: Int
    public let lastPage: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case lastPage = "last_page"
    }
}
