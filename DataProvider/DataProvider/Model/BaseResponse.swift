//
//  BaseResponse.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct BaseResponse<T: Decodable>: Decodable {
    public let data: T
    public let pagination: Pagination
}
