//
//  ForgotPasswordRequest.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 7/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct ForgotPasswordRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth

    public var path: String = "auth/forgot"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(email: String) {
        parameters["email"] = email
    }
}
