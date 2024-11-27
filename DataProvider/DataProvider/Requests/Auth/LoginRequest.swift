//
//  LoginRequest.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 9/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct LoginRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth

    public var path: String = "auth/login"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(username: String, password: String) {
        parameters["username"] = username
        parameters["password"] = password
    }
}
