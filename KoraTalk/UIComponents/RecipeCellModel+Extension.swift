//
//  RecipeCellViewModel+Extension.swift
//  KoraTalk
//
//  Created by Pavel Mac on 2/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

extension RecipeCellModel {
    
    convenience init(recipe: Recipe) {
        self.init(recipeId: recipe.id,
                  userId: recipe.user.id,
                  userImageUrl: recipe.user.image?.url,
                  username: recipe.user.username,
                  userRecipeAndFollowerCountText: "\(recipe.user.recipeCount) Recipe \(recipe.user.followingCount) Follower",
                  recipeTitle: recipe.title,
                  categoryName: recipe.category.name,
                  recipeImageUrl: recipe.images.first?.url,
                  recipeCommentAndLikeCountText: "\(recipe.commentCount) Recipe \(recipe.likeCount) Follow",
                  isEditorChoice: recipe.isEditorChoice)
    }
}
