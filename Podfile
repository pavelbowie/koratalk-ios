source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!

workspace 'KoraTalk'

$Alamofire =  pod 'Alamofire', '~> 5.4'
$TinyConstraints = pod "TinyConstraints", '~> 4.0'
$IQKeyboardManagerSwift = pod "IQKeyboardManagerSwift", '~> 6.5'
$SwiftLint = pod 'SwiftLint', '~> 0.44'
$MobilliumUserDefaults = pod 'MobilliumUserDefaults', '~> 2.0'
$MobilliumDateFormatter = pod 'MobilliumDateFormatter', '~> 1.2'
$MobilliumBuilders = pod 'MobilliumBuilders', '~> 1.4'
$Segmentio = pod 'Segmentio', '~> 4.1'
$Kingfisher = pod 'Kingfisher', :git => 'https://github.com/onevcat/Kingfisher.git', :branch => 'version6-xcode13'
$SwiftEntryKit = pod 'SwiftEntryKit', '~> 1.2'
$SKPhotoBrowser = pod 'SKPhotoBrowser', '~> 7.0'
$KeychainSwift = pod 'KeychainSwift', '~> 19.0'
$SwiftGen = pod 'SwiftGen', '~> 6.5'

#

target 'KoraTalk' do
  
  project 'KoraTalk.xcodeproj'

  # Pods for KoraTalk
  $Alamofire
  $TinyConstraints
  $IQKeyboardManagerSwift
  $SwiftLint
  $MobilliumUserDefaults
  $MobilliumDateFormatter
  $MobilliumBuilders
  $Segmentio
  $Kingfisher
  $SwiftEntryKit
  $SKPhotoBrowser
  $KeychainSwift
  
  target 'KoraTalkTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'KoraTalkUITests' do
    # Pods for testing
  end
end

#

target 'DataProvider' do
  
  project 'DataProvider/DataProvider.xcodeproj'
  
  # Pods for KoraTalkDataProvider
    
  target 'DataProviderTests' do
    inherit! :search_paths
    # Pods for testing
  end
end

#

target 'UIComponents' do
  
  project 'UIComponents/UIComponents.xcodeproj'
  
  # Pods for KoraTalkUIComponents
  $TinyConstraints
  $SwiftGen
  $MobilliumBuilders
  $Segmentio
  $Kingfisher
  $SwiftEntryKit
  
  target 'UIComponentsTests' do
    inherit! :search_paths
    # Pods for testing
  end
end

#

target 'Utilities' do
  
  project 'Utilities/Utilities.xcodeproj'
  
  # Pods for KoraTalkUtilities
  $MobilliumUserDefaults
  
  target 'UtilitiesTests' do
    inherit! :search_paths
    # Pods for testing
  end
end

#

target 'HeliosApp' do
  
  project 'HeliosApp/HeliosApp.xcodeproj'
  
  # Pods for HeliosApp
  # $IQKeyboardManagerSwift
  pod 'IQKeyboardManagerSwift', '~> 6.5'
  pod 'CountryPickerView'
  pod 'FlagPhoneNumber'
  pod 'IQKeyboardManager'
  pod 'OTPTextField'
  pod 'MessageKit'
  
end

#

target 'KoraTalkBeta' do
  
  project 'KoraTalkBeta/KoraTalkBeta.xcodeproj'
  
  # Pods for KoraTalkBeta
  pod 'SDWebImage', '~> 5.0'
  pod 'IQKeyboardToolbarManager'
  pod 'UITextView+Placeholder'
  pod 'MaterialComponents/TextControls+OutlinedTextAreas'
  pod 'MaterialComponents/TextControls+OutlinedTextFields'
  pod 'paper-onboarding', '~> 6.1.5'
  pod 'Loaf', '0.5.0'
  pod 'ProgressHUD'
  pod 'BottomPopup'
  
end

#

target 'KoraTalkChat' do
  
  project 'KoraTalkChat/KoraTalkChat.xcodeproj'
  
  # Pods for KoraTalkChat
  # pod 'ExyteChat'
  
end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      target.build_settings(config.name)['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
      #end
      #
      #installer.pods_project.build_configurations.each do |config|
       #config.build_settings['DEBUG_INFORMATION_FORMAT'] = 'DWARF with dSYM File'
       #config.build_settings['SWIFT_VERSION'] = '5.0'
       #config.build_settings['IOS_DEPLOYMENT_TARGET'] = '13.0'
      #end
      #
      #if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f > 13.0
       #config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
       #config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      #end
    end
  end
end
