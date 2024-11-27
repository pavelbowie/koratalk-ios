//
//  RecipeDetailRouter.swift
//  KoraTalk
//
//  Created by Pavel Mac on 1/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

final class RecipeDetailRouter: Router, RecipeDetailRouter.Routes {
    typealias Routes = LoginWarningPopupRoute &
        LoginRoute &
        UnfollowAlertViewRoute &
        CommentListRoute &
        ShareSheetRoute
}
