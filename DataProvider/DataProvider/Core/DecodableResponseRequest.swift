//
//  DecodableResponseRequest.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 5/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
