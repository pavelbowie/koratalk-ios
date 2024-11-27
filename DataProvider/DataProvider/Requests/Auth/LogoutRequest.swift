//
//  LogoutRequest.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 9/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public struct LogoutRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = SuccessResponse

    public var path: String = "auth/logout"
    public var method: RequestMethod = .post
    
    public init() {}
}
