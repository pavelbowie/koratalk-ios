//
//  UsersVc.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 25/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
import Loaf
import MessageUI
import SDWebImage
import ProgressHUD

class UsersVc: BaseVc {
    
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var usersArray = [UsersModel]()
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissDetailPopupObserver()
        ProgressHUD.colorAnimation = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        ProgressHUD.animationType = .circleRotateChase
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUsersListFromDataServer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    //MARK:- Adding observers
    func addDismissDetailPopupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(dismissDetailPopup), name: NSNotification.Name(rawValue: "dismissDetailPopup"), object: nil)
    }
    
    @objc func dismissDetailPopup(notification: NSNotification) {
        let message = UserDefaults.standard.string(forKey: "requestMessage")!
        Loaf(message, state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "dismissDetailPopup"), object: nil)
        addDismissDetailPopupObserver()
    }
    
    //MARK:- Fetch Users
    func getUsersListFromDataServer() {
        if isInternetConnected() {
            self.hideInfoLabel()
            self.usersArray.removeAll()
            let myEmail = UserDefaults.standard.string(forKey: "userEmail")!
            ProgressHUD.animate("Please Wait", interaction: false)
            CoreData.shared().reference().child("Users").observe(.childAdded) { [weak self] (snapshot) in
                guard let strongSelf = self else {
                    ProgressHUD.dismiss()
                    return
                }
                if snapshot.exists() {
                    guard let user = snapshot.value as? [String: String] else {
                        ProgressHUD.dismiss()
                        strongSelf.showInfoLabel(message: "No nearby users available.")
                        return
                    }
                    if user["email"]!.lowercased() != myEmail.lowercased() {
                        strongSelf.usersArray.append(UsersModel(userName: user["username"]! , userImage: user["image"]!, userEmail: user["email"]!, userAbout: user["about"]!, userLatitude: user["lat"]!, userLongitude: user["lng"]!, userGender: user["gender"]!, userStatus: user["status"]!))
                    }
                    DispatchQueue.main.async {
                        ProgressHUD.dismiss()
                        strongSelf.usersTableView.reloadData()
                        if strongSelf.usersArray.count == 0 {
                            strongSelf.showInfoLabel(message: "No nearby users available.")
                        }
                    }
                } else {
                    ProgressHUD.dismiss()
                    strongSelf.showInfoLabel(message: "No nearby users available.")
                }
            }
        } else {
            self.showInfoLabel(message: "You're not connected to the Internet")
        }
    }
    
    //MARK:- Show Information Label
    func showInfoLabel(message: String) {
        infoLabel.isHidden = false
        usersTableView.isHidden = true
        infoLabel.text = message
    }
    
    //MARK:- Hide Information Label
    func hideInfoLabel() {
        infoLabel.isHidden = true
        usersTableView.isHidden = false
    }
    
    @IBAction func flagAbusiveUsers(_ sender: UIButton) {
        let alert = UIAlertController(title: "KoraTalk support", message: "Flag and report objectionable content or users violating KoraTalk community rules", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Report", style: .default , handler:{ (UIAlertAction)in
            guard MFMailComposeViewController.canSendMail() else {
                Loaf("Your device is not configured to send email's at the moment.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
                return
            }
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["support@apricus.kz"])
            mail.setSubject("Objectionable content/Users")
            mail.setMessageBody("", isHTML: true)
            self.present(mail, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.popoverPresentationController?.sourceView = self.view
        self.present(alert, animated: true)
    }
    
    //MARK:- Check User Status
    func checkUserStatus(userEmail: String, myEmail: String, indexNumber: Int) {
        if isInternetConnected() {
            CoreData.shared().reference().child("BlockedUsers").child(userEmail).child(myEmail).observeSingleEvent(of: .value) { [weak self] (snapshot) in
                guard let strongSelf = self else {
                    return
                }
                if snapshot.exists() {
                    Loaf("You have been blocked by \(strongSelf.usersArray[indexNumber].userName).", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: strongSelf).show()
                } else {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "DetailPopupVc") as! DetailPopupVc
                    vc.userEmail = strongSelf.usersArray[indexNumber].userEmail
                    vc.userName = strongSelf.usersArray[indexNumber].userName
                    vc.userGender = strongSelf.usersArray[indexNumber].userGender
                    vc.userImg = strongSelf.usersArray[indexNumber].userImage
                    vc.userAbout = strongSelf.usersArray[indexNumber].userAbout
                    strongSelf.present(vc, animated: true, completion: nil)
                }
            }
        } else {
            Loaf("You're not connected to the Internet", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
        }
    }
}

//MARK:- Mail Delegate
extension UsersVc: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

//MARK:- UITableView Delegates
extension UsersVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsersCell") as? UsersCell else {return UITableViewCell()}
        cell.userImageView.sd_setImage(with: URL(string: usersArray[indexPath.row].userImage), placeholderImage: #imageLiteral(resourceName: "def"))
        cell.userNameLabel.text = usersArray[indexPath.row].userName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myEmail = UserDefaults.standard.string(forKey: "userEmail")!.components(separatedBy: "@").first!
        let userEmail = usersArray[indexPath.row].userEmail.components(separatedBy: "@").first!
        checkUserStatus(userEmail: userEmail, myEmail: myEmail, indexNumber: indexPath.row)
    }
}
