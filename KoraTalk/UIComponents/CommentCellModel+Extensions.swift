//
//  CommentCellModel+Extensions.swift
//  KoraTalk
//
//  Created by Pavel Mac on 23/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import MobilliumUserDefaults

extension CommentCellModel {
    
    convenience init(comment: RecipeComment) {
        let recipeAndFollowerCountText = "\(comment.user.recipeCount) \(L10n.General.recipe) \(comment.user.followedCount) \(L10n.General.follower)"
        let isOwner = comment.user.id == DefaultsKey.userId.value
        self.init(userId: comment.user.id,
                  imageUrl: comment.user.image?.url,
                  username: comment.user.username,
                  recipeAndFollowerCountText: recipeAndFollowerCountText,
                  timeDifferenceText: comment.timeDifference,
                  commentId: comment.id,
                  commentText: comment.text,
                  isOwner: isOwner)
    }
}
