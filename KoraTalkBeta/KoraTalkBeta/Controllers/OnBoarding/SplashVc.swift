//
//  SplashVc.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 27/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

final class SplashVc: UIViewController {
    
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var existingAccountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureExistingAccountLabel()
    }
    
    private func configureExistingAccountLabel() {
        let fullText = "Read our Privacy Policy. Tap \"Agree and Continue\" to accept the Terms of Services."
        let clickablePart = "Log in"
        
        // Use the UILabel extension method to set attributed text
        existingAccountLabel.setAttributedTextWithClickablePart(
            fullText: fullText,
            clickablePart: clickablePart,
            action: #selector(existingAccountLabelTapped),
            target: self
        )
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
    
    @objc private func existingAccountLabelTapped(_ gesture: UITapGestureRecognizer) {
        guard let label = gesture.view as? UILabel, let text = label.text else { return }
        
        let fullText = NSString(string: text)
        let range = fullText.range(of: "Log in")
        
        if label.didTapAttributedTextInRange(range, gesture: gesture) {
            navigateToSignInVc()
        }
    }
    
    private func navigateToSignInVc() {
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "ToSignInVC") {
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}

