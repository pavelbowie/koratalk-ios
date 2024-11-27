//
//  OnboardingVc.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 10/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
import Loaf
import ProgressHUD
import paper_onboarding
import AuthenticationServices

class OnboardingVc: BaseVc {
    
    @IBOutlet weak var onboardingView: PaperOnboarding!
    
    private var currentNonce: String?
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProgressHUD.colorAnimation = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        ProgressHUD.colorBannerMessage = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        ProgressHUD.colorStatus = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        ProgressHUD.animationType = .circleRotateChase
        
        onboardingView.dataSource = self
        onboardingView.delegate = self
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    //MARK:- Login With Phone
    @IBAction func loginWithCredentials(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "SignInVc") as! SignInVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- Login With Apple
    @IBAction func loginWithApple(_ sender: UIButton) {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIdProvider = ASAuthorizationAppleIDProvider()
        let request = appleIdProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    //MARK:- SignUp
    @IBAction func signup(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "SignUpVc") as! SignUpVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func fbButtonTapped(_ sender: Any) {
        //
    }
    
    @IBAction func googleButtonTapped(_ sender: Any) {
        //
    }
    
    @IBAction func appleButtonTapped(_ sender: Any) {
        //
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        //
    }
    
    @IBAction func privacyButtonTapped(_ sender: Any) {
        //
    }
    
    //MARK:- Check User Existence
    func checkUserExistence(email: String) {
        if isInternetConnected() {
            ProgressHUD.animate("Please Wait", interaction: false)
            CoreData.shared().reference().child("Users").child(email.components(separatedBy: "@").first!).observeSingleEvent(of: .value) { [weak self] (snapshot) in
                guard let strongSelf = self else {
                    ProgressHUD.dismiss()
                    return
                }
                if snapshot.exists() {
                    guard let user = snapshot.value as? [String: String] else {
                        ProgressHUD.dismiss()
                        Loaf("Unable to Login at this moment.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: strongSelf).show()
                        return
                    }
                    if user["email"]!.lowercased() == email.lowercased() {
                        ProgressHUD.dismiss()
                        strongSelf.proceedFurther(email: email, isPartialSignUp: false, isCompleteSignUp: true)
                    } else {
                        ProgressHUD.dismiss()
                        strongSelf.proceedFurther(email: email, isPartialSignUp: true, isCompleteSignUp: false)
                    }
                } else {
                    ProgressHUD.dismiss()
                    strongSelf.proceedFurther(email: email, isPartialSignUp: true, isCompleteSignUp: false)
                }
            }
        } else {
            Loaf("You're not connected to the Internet", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
        }
    }
    
    //MARK:- Proceed
    func proceedFurther(email: String, isPartialSignUp: Bool, isCompleteSignUp: Bool) {
        UserDefaults.standard.set(isPartialSignUp, forKey: "isPartialSignUp")
        UserDefaults.standard.set(isCompleteSignUp, forKey: "isCompleteSignUp")
        UserDefaults.standard.set(email.lowercased(), forKey: "userEmail")
        if isPartialSignUp {
            let vc = self.storyboard?.instantiateViewController(identifier: "ExtraSignUpVc") as! ExtraSignUpVc
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            CoreData.shared().reference().child("Users/\(email.components(separatedBy: "@").first!)/status").setValue("online") { error, _ in
                if let error = error {
                    ProgressHUD.dismiss()
                    print(error.localizedDescription)
                    Loaf("Unable to login at the moment.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                } else {
                    ProgressHUD.dismiss()
                    let vc = self.storyboard?.instantiateViewController(identifier: "TabBarVc")
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
            }
        }
    }
}

//MARK:- ASAuthorizationController Delegate
extension OnboardingVc: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIdCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                Loaf("Invalid state: A login callback was received, but no login request was sent.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                return
            }
            guard let appleIdToken = appleIdCredential.identityToken else {
                Loaf("Unable to fetch identity token.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                return
            }
            guard let idTokenString = String(data: appleIdToken, encoding: .utf8) else {
                print(appleIdToken.debugDescription)
                Loaf("Unable to serialize token string from data.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                return
            }
            
            //MARK:- Init
            let credential = OAuthProvider.credential(withProviderID: "apricus.kz",
                                                      idToken: idTokenString,
                                                      rawNonce: nonce)
            
            CoreData.instance().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    Loaf(error.localizedDescription, state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                    return
                }
                if let email = authResult?.user.email {
                    self.checkUserExistence(email: email)
                }
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        Loaf(error.localizedDescription, state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
    }
}

//MARK:- Presenting the Sign in with Apple content to the user in a modal sheet
extension OnboardingVc: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

//MARK:- OnBoarding Delegates
extension OnboardingVc: PaperOnboardingDelegate, PaperOnboardingDataSource {
    func onboardingItemsCount() -> Int {
        return 2
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return [
            OnboardingItemInfo(informationImage: UIImage(named: "img_background_1") ?? UIImage(),
                               title: "Welcome",
                               description: "Welcome to KoraTalk, where you will meet new people and enjoy meeting the ones you like. Whether you need to find a boyfriend, girlfriend, or a soulmate to chat with about everything in the world, you’ll surely be satisfied with our offers. Don’t miss out on your chance to expand your social circle.",
                               pageIcon: UIImage(),
                               color: .clear,
                               titleColor: .black,
                               descriptionColor: .lightGray,
                               titleFont: UIFont(name: "Inter-Semibold", size: 18)!,
                               descriptionFont: UIFont(name: "Inter-Regular", size: 14)!),
            
            OnboardingItemInfo(informationImage: UIImage(named: "img_background_2") ?? UIImage(),
                               title: "Connect & Chat",
                               description: "Explore, Connect and easily start unique conversations with friends from all over the world. Send a message and introduce yourself to people you’d like to get to know better, and then take your friendship from there. Our app is a great tool for you to grow your social circle, meet and date new people.",
                               pageIcon: UIImage(),
                               color: .clear,
                               titleColor: .black,
                               descriptionColor: .lightGray,
                               titleFont: UIFont(name: "Inter-Semibold", size: 18)!,
                               descriptionFont: UIFont(name: "Inter-Regular", size: 14)!)
        ][index]
    }
}
