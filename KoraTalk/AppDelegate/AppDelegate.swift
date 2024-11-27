//
//  AppDelegate.swift
//  KoraTalk
//
//  Created by Pavel Mac on 3/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureIQKeyboardManager()
        configureSKPhotoBrowser()
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        self.window?.makeKeyAndVisible()
        
        AppMainRouter.shared.startApp()
        
        //let swiftUIView = SomeSwiftUIView() // swiftUIView is View
        //let viewCtrl = UIHostingController(rootView: swiftUIView)
        
        return true
    }
}
