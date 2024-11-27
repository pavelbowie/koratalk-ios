//
//  LoginRouter.swift
//  KoraTalk
//
//  Created by Pavel Mac on 1/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

final class LoginRouter: Router, LoginRouter.Routes {
    typealias Routes = RegisterRoute & PasswordResetRoute
}
