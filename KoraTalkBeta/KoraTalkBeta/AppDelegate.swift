//
//  AppDelegate.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 3/11/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
import IQKeyboardToolbarManager
import ProgressHUD

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirstTime") == nil {
            defaults.set("No", forKey:"isFirstTime")
            defaults.set("", forKey:"userEmail")
            defaults.set(false, forKey:"isPartialSignUp")
            defaults.set(false, forKey:"isCompleteSignUp")
        }
        
        setupKeyboard()
        setupInitialVc()
        
        return true
    }
    
    func setupKeyboard() {
        IQKeyboardToolbarManager.shared.isEnabled = true
        IQKeyboardToolbarManager.shared.toolbarConfiguration.useTextInputViewTintColor = true
        IQKeyboardToolbarManager.shared.toolbarConfiguration.tintColor = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        IQKeyboardToolbarManager.shared.toolbarConfiguration.barTintColor = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        IQKeyboardToolbarManager.shared.toolbarConfiguration.previousNextDisplayMode = .alwaysShow
        IQKeyboardToolbarManager.shared.toolbarConfiguration.manageBehavior = .byPosition

        IQKeyboardToolbarManager.shared.toolbarConfiguration.placeholderConfiguration.showPlaceholder = false
        IQKeyboardToolbarManager.shared.toolbarConfiguration.placeholderConfiguration.font = UIFont(name: "Inter-Regular", size: 14)
        IQKeyboardToolbarManager.shared.toolbarConfiguration.placeholderConfiguration.color = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        IQKeyboardToolbarManager.shared.toolbarConfiguration.placeholderConfiguration.buttonColor = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        IQKeyboardToolbarManager.shared.playInputClicks = false
        
        //ProgressHUD.animate("Please wait", interaction: false)

//        IQKeyboardToolbarManager.shared.disabledToolbarClasses.append(ChattingVc.self)
//        IQKeyboardToolbarManager.shared.enabledToolbarClasses.append(UsersVc.self)
//        IQKeyboardToolbarManager.shared.deepResponderAllowedContainerClasses.append(UIStackView.self)
    }
    
    //MARK:- Init
    func setupInitialVc() {
        let userdefaults = UserDefaults.standard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var initialVc = storyboard.instantiateViewController(identifier: "OnboardingVc")
        if userdefaults.bool(forKey: "isPartialSignUp") {
            initialVc = storyboard.instantiateViewController(identifier: "ExtraSignUpVc")
            self.window?.rootViewController = UINavigationController(rootViewController: initialVc)
        } else if userdefaults.bool(forKey: "isCompleteSignUp"){
            initialVc = storyboard.instantiateViewController(identifier: "TabBarVc")
            self.window?.rootViewController = UINavigationController(rootViewController: initialVc)
        } else {
            self.window?.rootViewController = UINavigationController(rootViewController: initialVc)
        }
        self.window?.makeKeyAndVisible()
    }
}

