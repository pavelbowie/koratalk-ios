//
//  RegisterRequest.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 9/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct RegisterRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth

    public var path: String = "auth/register"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(username: String, email: String, password: String) {
        parameters["username"] = username
        parameters["email"] = email
        parameters["password"] = password
    }
}
