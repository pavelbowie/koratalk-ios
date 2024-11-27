//
//  CommentCellModel.swift
//  UIComponents
//
//  Created by Pavel Mac on 25/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

public protocol CommentCellDataSource: AnyObject {
    var userId: Int { get }
    var imageUrl: String? { get }
    var username: String? { get }
    var recipeAndFollowerCountText: String? { get }
    var timeDifferenceText: String? { get }
    var commentId: Int { get }
    var commentText: String? { get set }
    var isOwner: Bool { get set }
}

public protocol CommentCellEventSource: AnyObject {
    var moreButtonTapped: VoidClosure? { get set }
    var commentTextDidChanged: VoidClosure? { get set }
}

public protocol CommentCellProtocol: CommentCellDataSource, CommentCellEventSource {}

public final class CommentCellModel: CommentCellProtocol {
    
    public var userId: Int
    public var imageUrl: String?
    public var username: String?
    public var recipeAndFollowerCountText: String?
    public var timeDifferenceText: String?
    public var commentId: Int
    public var commentText: String?
    public var isOwner: Bool
    public var moreButtonTapped: VoidClosure?
    public var commentTextDidChanged: VoidClosure?

    public init(userId: Int,
                imageUrl: String?,
                username: String?,
                recipeAndFollowerCountText: String?,
                timeDifferenceText: String?,
                commentId: Int,
                commentText: String?,
                isOwner: Bool) {
        self.userId = userId
        self.imageUrl = imageUrl
        self.username = username
        self.recipeAndFollowerCountText = recipeAndFollowerCountText
        self.timeDifferenceText = timeDifferenceText
        self.commentId = commentId
        self.commentText = commentText
        self.isOwner = isOwner
    }
}
