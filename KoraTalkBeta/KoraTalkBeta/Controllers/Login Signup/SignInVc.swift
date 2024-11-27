//
//  SignInVc.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 9/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
import Loaf
import ProgressHUD
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class SignInVc: BaseVc {
    
    @IBOutlet weak var emailTextField: MDCOutlinedTextField!
    @IBOutlet weak var passwordTextField: MDCOutlinedTextField!
    @IBOutlet weak var goBackButton: UIButton!
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTextFields()
        hideKeyboardWhenTappedAround()
        ProgressHUD.colorAnimation = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        ProgressHUD.animationType = .circleRotateChase
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        goBackButton.roundCorners(corners: [.topRight, .bottomRight], radius: 10.0)
    }
    
    //MARK:- Customize Material Design TextFields Appearance
    func prepareTextFields() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        customizeMaterialDesignTextFields(textField: emailTextField, labelText: "Phone number", imageName: "mail", hintText: "")
        customizeMaterialDesignPasswordTextFields(textField: passwordTextField, labelText: "Password", imageName: "password", tag: 0)
    }
    
    //MARK:- Signin
    @IBAction func signin(_ sender: UIButton) {
        if emailTextField.text != "", passwordTextField.text != "" {
            let isValidEmail = emailTextField.text!.isValidEmail()
            
            ProgressHUD.animate("Please Wait", interaction: false)
            proceeedLogin(email: emailTextField.text!, password: passwordTextField.text!)
            return
            
//            if isValidEmail {
//                if isInternetConnected() {
//                    ProgressHUD.animate("Please Wait", interaction: false)
//                    proceeedLogin(email: emailTextField.text!, password: passwordTextField.text!)
//                } else {
//                    Loaf("You're not connected to the Internet", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
//                }
//            } else {
//                Loaf("Please enter a valid phone.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
//            }
        } else {
            Loaf("Both fields phone and password are required.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
        }
    }
    
    //MARK:- Proceed
    func proceeedLogin(email: String, password: String) {
        let tmp = email
        CoreData.instance().signIn(withEmail: tmp, password: password) { (authResult, error) in
            if let error = error as NSError? {
                
                ProgressHUD.dismiss()
                
                if let authErrorCode = AuthErrorCode.Code(rawValue: error.code) {
                    switch authErrorCode {
                    case .operationNotAllowed:
                        Loaf("This account is not enabled.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                    case .userDisabled:
                        Loaf("The user account has been disabled by an administrator.", state: .info, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                    case .wrongPassword:
                        Loaf("The password is invalid or the user does not have a password.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                    //case .invalidEmail:
                    //    Loaf("Please enter a valid phone.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                    default:
                        print("Error: \(error.localizedDescription)")
                        Loaf("Something went wrong while login in your account. Try again later. \nMaybe you're not a human or need SignUp in KoraTalk", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                    }
                }
                
            } else {
                CoreData.shared().reference().child("Users/\(email.components(separatedBy: "@").first!)/status").setValue("online") { error, _ in
                    if let error = error {
                        ProgressHUD.dismiss()
                        print(error.localizedDescription)
                        Loaf("Unable to login at the moment.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                    } else {
                        ProgressHUD.dismiss()
                        UserDefaults.standard.set(false, forKey: "isPartialSignUp")
                        UserDefaults.standard.set(true, forKey: "isCompleteSignUp")
                        UserDefaults.standard.set(email.lowercased(), forKey: "userEmail")
                        let vc = self.storyboard?.instantiateViewController(identifier: "TabBarVc")
                        self.navigationController?.pushViewController(vc!, animated: true)
                    }
                }
            }
        }
    }
    
    //MARK:- SignUp
    @IBAction func signUp(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "SignUpVc") as! SignUpVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func eulaPolicy(_ sender: UIButton) {
        if isInternetConnected() {
            let vc = storyboard?.instantiateViewController(withIdentifier: "PrivacyPolicyVc") as! PrivacyPolicyVc
            vc.policyUrl = "https://apricus.kz/privacy-policy/"
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
            Loaf("You're not connected to the Internet", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
        }
    }
    
    //MARK:- Privacy Policy
    @IBAction func privacyPolicy(_ sender: UIButton) {
        if isInternetConnected() {
            let vc = storyboard?.instantiateViewController(withIdentifier: "PrivacyPolicyVc") as! PrivacyPolicyVc
            vc.policyUrl = "https://apricus.kz/privacy-policy/"
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
            Loaf("You're not connected to the Internet", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
        }
    }
}

//MARK:- UITextField delegates
extension SignInVc: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

