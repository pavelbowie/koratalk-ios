//
//  EmptyCellModel.swift
//  UIComponents
//
//  Created by Pavel Mac on 4/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

public protocol EmptyCellDataSource: AnyObject {
    
}

public protocol EmptyCellEventSource: AnyObject {
    
}

public protocol EmptyCellProtocol: EmptyCellDataSource, EmptyCellEventSource {
    
}

public final class EmptyCellModel: EmptyCellProtocol {
    
}
