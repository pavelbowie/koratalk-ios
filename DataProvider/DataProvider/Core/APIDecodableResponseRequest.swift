//
//  APIRequest.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 4/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public protocol APIDecodableResponseRequest: DecodableResponseRequest {}

// MARK: - RequestEncoding
public extension APIDecodableResponseRequest {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

// MARK: - url
public extension APIDecodableResponseRequest {
    var url: String {
        return "https://apricus.kz/api/" + path
    }
}

// MARK: - RequestParameters
public extension APIDecodableResponseRequest {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
public extension APIDecodableResponseRequest {
    var headers: RequestHeaders {
        return [:]
    }
}
