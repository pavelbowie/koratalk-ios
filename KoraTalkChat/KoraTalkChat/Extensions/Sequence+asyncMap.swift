//
//  Sequence+asyncMap.swift
//  KoraTalkChat
//
//  Created by Pavel Mac on 10/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

extension Sequence {
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }
        return values
    }
}