//
//  KoraTalkDataProviderProtocol.swift
//  KoraTalkDataProvider
//
//  Created by Pavel Mac on 4/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

public typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol DataProviderProtocol {
    
    func request<T: DecodableResponseRequest>(for request: T,
                                              result: DataProviderResult<T.ResponseType>?)
}
