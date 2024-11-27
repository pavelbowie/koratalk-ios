//
//  SignUpVc.swift
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

class SignUpVc: BaseVc {
    
    @IBOutlet weak var emailTextField: MDCOutlinedTextField!
    @IBOutlet weak var passwordTextField: MDCOutlinedTextField!
    @IBOutlet weak var confirmPasswordTextField: MDCOutlinedTextField!
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
        confirmPasswordTextField.delegate = self
        customizeMaterialDesignTextFields(textField: emailTextField, labelText: "Phone number", imageName: "mail", hintText: "")
        customizeMaterialDesignPasswordTextFields(textField: passwordTextField, labelText: "Password", imageName: "password", tag: 0)
        customizeMaterialDesignPasswordTextFields(textField: confirmPasswordTextField, labelText: "Confirm Password", imageName: "password", tag: 1)
    }
    
    //MARK:- SignUp
    @IBAction func signup(_ sender: UIButton) {
        if emailTextField.text != "", passwordTextField.text != "", confirmPasswordTextField.text != "" {
            
            let tmp = emailTextField.text!
            
            ProgressHUD.animate("Please Wait", interaction: false)
            proceedSignUp(email: tmp, password: passwordTextField.text!)
            
            if emailTextField.text!.isValidEmail() {
                if passwordTextField.text == confirmPasswordTextField.text {
                    let isValidPassword = isValidPassword(passwordTextField.text!)
                    if isValidPassword {
                        if isInternetConnected() {
                            ProgressHUD.animate("Please Wait", interaction: false)
                            proceedSignUp(email: emailTextField.text!, password: passwordTextField.text!)
                        } else {
                            Loaf("You're not connected to the Internet", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                        }
                    } else {
                        Loaf("The password must be 6 characters long or more.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                    }
                } else {
                    Loaf("Passwords do not match.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                }
            } else {
                ProgressHUD.animate("Please Wait", interaction: false)
                proceedSignUp(email: tmp, password: passwordTextField.text!)
                
                //Loaf("Please enter a valid phone.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
            }
        } else {
            Loaf("All empty fields are required.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
        }
    }
    
    //MARK:- Proceed SignUp
    func proceedSignUp(email: String, password: String) {
        
        let tmpM = email + "@" + "minimalhd.es"
        
        CoreData.instance().createUser(withEmail: tmpM, password: password) { `authResult`, error in
            if let error = error as NSError? {
                
                ProgressHUD.dismiss()
                
                if let authErrorCode = AuthErrorCode.Code(rawValue: error.code) {
                    switch authErrorCode {
                    case .operationNotAllowed:
                        Loaf("Unable to signup at this time. Please try again.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                    case .emailAlreadyInUse:
                        Loaf("The Phone number is already in use by another account.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
//                    case .invalidEmail:
//                        Loaf("Please enter a valid phone.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                    case .weakPassword:
                        Loaf("The password must be 6 characters long or more.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                    default:
                        
                        //ProgressHUD.dismiss()
                        //UserDefaults.standard.set(true, forKey: "isPartialSignUp")
                        UserDefaults.standard.set(false, forKey: "isCompleteSignUp")
                        UserDefaults.standard.set(email.lowercased(), forKey: "userEmail")
                        let vc = self.storyboard?.instantiateViewController(identifier: "ExtraSignUpVc") as! ExtraSignUpVc
                        self.navigationController?.pushViewController(vc, animated: true)
                        ProgressHUD.dismiss()
                        
                        //print("Error: \(error.localizedDescription)")
                        //Loaf("Something went wrong while signing up.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                    }
                }
            } else {
                ProgressHUD.dismiss()
                UserDefaults.standard.set(true, forKey: "isPartialSignUp")
                UserDefaults.standard.set(false, forKey: "isCompleteSignUp")
                UserDefaults.standard.set(email.lowercased(), forKey: "userEmail")
                let vc = self.storyboard?.instantiateViewController(identifier: "ExtraSignUpVc") as! ExtraSignUpVc
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

//MARK:- UITextField delegates
extension SignUpVc: UITextFieldDelegate {
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

