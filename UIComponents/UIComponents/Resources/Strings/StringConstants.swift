// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Components {
    public enum Action {
      /// Components.strings
      ///  KoraTalk
      ///  
      ///  Created by Pavel Mac on 5/11/2024.
      ///  Copyright © 2024 Apricus-LLP. All rights reserved.
      public static let block = L10n.tr("Components", "Action.block", fallback: "Block")
      /// Warning
      public static let loginWarning = L10n.tr("Components", "Action.loginWarning", fallback: "Warning")
    }
    public enum Comment {
      /// Placeholder
      public static let placeholder = L10n.tr("Components", "Comment.placeholder", fallback: "Placeholder")
    }
  }
  public enum Error {
    /// Please wait
    public static let checkInformations = L10n.tr("Error", "checkInformations", fallback: "Please wait")
    /// Error.strings
    ///  KoraTalk
    ///  
    ///  Created by Pavel Mac on 10/11/2024.
    ///  Copyright © 2024 Apricus-LLP. All rights reserved.
    public static func empty(_ p1: Any) -> String {
      return L10n.tr("Error", "empty", String(describing: p1), fallback: "%@ empty")
    }
    /// Please wait
    public static let emptyFields = L10n.tr("Error", "emptyFields", fallback: "Please wait")
    /// Please wait
    public static let refreshFromTop = L10n.tr("Error", "refreshFromTop", fallback: "Please wait")
    public enum Key {
      /// Comment
      public static let comment = L10n.tr("Error", "Key.comment", fallback: "Comment")
      /// E-mail
      public static let email = L10n.tr("Error", "Key.email", fallback: "E-mail")
      /// Username
      public static let username = L10n.tr("Error", "Key.username", fallback: "Username")
    }
  }
  public enum General {
    /// comments
    public static let addComment = L10n.tr("General", "addComment", fallback: "comments")
    /// comment
    public static let comment = L10n.tr("General", "comment", fallback: "comment")
    /// comments
    public static let comments = L10n.tr("General", "comments", fallback: "comments")
    /// follow
    public static let follow = L10n.tr("General", "follow", fallback: "follow")
    /// follower
    public static let follower = L10n.tr("General", "follower", fallback: "follower")
    /// following
    public static let following = L10n.tr("General", "following", fallback: "following")
    /// giveUp
    public static let giveUp = L10n.tr("General", "giveUp", fallback: "giveUp")
    /// like
    public static let like = L10n.tr("General", "like", fallback: "like")
    /// login
    public static let login = L10n.tr("General", "login", fallback: "login")
    /// recipe
    public static let recipe = L10n.tr("General", "recipe", fallback: "recipe")
    /// recipeIngredients
    public static let recipeIngredients = L10n.tr("General", "recipeIngredients", fallback: "recipeIngredients")
    /// recipeIngredients
    public static let recipeSteps = L10n.tr("General", "recipeSteps", fallback: "recipeIngredients")
    /// register
    public static let register = L10n.tr("General", "register", fallback: "register")
  }
  public enum Modules {
    public enum CommentEditController {
      /// Save
      public static let save = L10n.tr("Modules", "CommentEditController.save", fallback: "Save")
      /// Comment
      public static let title = L10n.tr("Modules", "CommentEditController.title", fallback: "Comment")
    }
    public enum CommentListController {
      /// Comments
      public static let title = L10n.tr("Modules", "CommentListController.title", fallback: "Comments")
    }
    public enum Favorites {
      /// SEE ALL
      public static let seeAllButtonTitle = L10n.tr("Modules", "Favorites.seeAllButtonTitle", fallback: "SEE ALL")
    }
    public enum Home {
      /// FLOWS
      public static let editorChoiceRecipes = L10n.tr("Modules", "Home.editorChoiceRecipes", fallback: "FLOWS")
      /// NEWS
      public static let lastAddedRecipes = L10n.tr("Modules", "Home.lastAddedRecipes", fallback: "NEWS")
      /// %@ Comment %@ Like
      public static func recipeCommentAndLikeCountText(_ p1: Any, _ p2: Any) -> String {
        return L10n.tr("Modules", "Home.recipeCommentAndLikeCountText", String(describing: p1), String(describing: p2), fallback: "%@ Comment %@ Like")
      }
      /// %@ Recipe %@ Follower
      public static func userRecipeAndFollowerCount(_ p1: Any, _ p2: Any) -> String {
        return L10n.tr("Modules", "Home.userRecipeAndFollowerCount", String(describing: p1), String(describing: p2), fallback: "%@ Recipe %@ Follower")
      }
    }
    public enum LoginViewController {
      /// Bottom Text
      public static let bottomText = L10n.tr("Modules", "LoginViewController.bottomText", fallback: "Bottom Text")
      /// Forgot Password?
      public static let forgotPassword = L10n.tr("Modules", "LoginViewController.forgotPassword", fallback: "Forgot Password?")
      /// Login
      public static let title = L10n.tr("Modules", "LoginViewController.title", fallback: "Login")
    }
    public enum PasswordResetController {
      /// Reset
      public static let reset = L10n.tr("Modules", "PasswordResetController.reset", fallback: "Reset")
      /// Password Reset
      public static let title = L10n.tr("Modules", "PasswordResetController.title", fallback: "Password Reset")
    }
    public enum RecipeDetail {
      /// No comment.
      public static let noComment = L10n.tr("Modules", "RecipeDetail.noComment", fallback: "No comment.")
    }
    public enum RegisterViewController {
      /// Bottom Text
      public static let bottomText = L10n.tr("Modules", "RegisterViewController.bottomText", fallback: "Bottom Text")
      /// Register
      public static let title = L10n.tr("Modules", "RegisterViewController.title", fallback: "Register")
    }
    public enum SignIn {
      /// Modules.strings
      ///  KoraTalk
      ///  
      ///  Created by Pavel Mac on 10/11/2024.
      ///  Copyright © 2024 Apricus-LLP. All rights reserved.
      public static let navigationTitle = L10n.tr("Modules", "SignIn.navigationTitle", fallback: "Sign In")
    }
    public enum WalkThrough {
      /// KoraTalk is the best place to find your favorite friends, events & communites all around the world.
      public static let descriptionText = L10n.tr("Modules", "WalkThrough.descriptionText", fallback: "KoraTalk is the best place to find your favorite friends, events & communites all around the world.")
      /// Welcome to KoraTalk Community!
      public static let firstTitle = L10n.tr("Modules", "WalkThrough.firstTitle", fallback: "Welcome to KoraTalk Community!")
      /// Share event with others
      public static let fourthTitle = L10n.tr("Modules", "WalkThrough.fourthTitle", fallback: "Share event with others")
      /// Next
      public static let next = L10n.tr("Modules", "WalkThrough.Next", fallback: "Next")
      /// Finding events were not that easy
      public static let secondTitle = L10n.tr("Modules", "WalkThrough.secondTitle", fallback: "Finding events were not that easy")
      /// Start
      public static let start = L10n.tr("Modules", "WalkThrough.Start", fallback: "Start")
      /// Add new events
      public static let thirdTitle = L10n.tr("Modules", "WalkThrough.thirdTitle", fallback: "Add new events")
    }
  }
  public enum Placeholder {
    /// E-mail address
    public static let email = L10n.tr("Placeholder", "email", fallback: "E-mail address")
    /// Password
    public static let password = L10n.tr("Placeholder", "password", fallback: "Password")
    /// Placeholder.strings
    ///  KoraTalk
    ///  
    ///  Created by Pavel Mac on 10/11/2024.
    ///  Copyright © 2024 Apricus-LLP. All rights reserved.
    public static let username = L10n.tr("Placeholder", "username", fallback: "Username")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
