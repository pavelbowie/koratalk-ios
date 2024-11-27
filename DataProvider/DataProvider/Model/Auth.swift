//
//  Auth.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct Auth: Decodable {
    public let token: String
    public let user: User
}
