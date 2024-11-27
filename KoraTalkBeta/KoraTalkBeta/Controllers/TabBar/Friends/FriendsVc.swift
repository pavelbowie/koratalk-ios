//
//  FriendsVc.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 25/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
import SDWebImage
import Loaf
import ProgressHUD

class FriendsVc: BaseVc {
    
    @IBOutlet weak var friendsTableView: UITableView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var friendsArray = [UsersModel]()
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.colorAnimation = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        ProgressHUD.animationType = .circleRotateChase
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFriendsListFromDataServer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    //MARK:- Fetch Friends
    func getFriendsListFromDataServer() {
        if isInternetConnected() {
            self.hideInfoLabel()
            self.friendsArray.removeAll()
            let myEmail = UserDefaults.standard.string(forKey: "userEmail")!.components(separatedBy: "@").first!
            ProgressHUD.animate("Please Wait", interaction: false)
            CoreData.shared().reference().child("FriendsAndRequests").child(myEmail).child("Friends").observeSingleEvent(of: .value) { [weak self] (snapshot) in
                guard let strongSelf = self else {
                    ProgressHUD.dismiss()
                    return
                }
                if snapshot.exists() {
                    for child in snapshot.children {
                        if let childSnapshot = child as? DataSnapshot,
                           let dictionary = childSnapshot.value as? [String:Any] {
                            strongSelf.getFriendDetail(email: dictionary["email"] as! String)
                        }
                    }
                } else {
                    ProgressHUD.dismiss()
                    strongSelf.showInfoLabel(message: "You don't have any friends.")
                }
            }
        } else {
            self.showInfoLabel(message: "You're not connected to the Internet")
        }
    }
    
    //MARK:- Get detail about friends
    func getFriendDetail(email: String) {
        CoreData.shared().reference().child("Users").child(email).observeSingleEvent(of: .value) { [weak self] (snapshot) in
            guard let strongSelf = self else {
                ProgressHUD.dismiss()
                return
            }
            if snapshot.exists() {
                guard let dictionary = snapshot.value as? [String: String] else {
                    Loaf("Unable to fetch friends list at the moment.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: strongSelf).show()
                    ProgressHUD.dismiss()
                    return
                }
                strongSelf.friendsArray.append(UsersModel(userName: dictionary["username"]!, userImage: dictionary["image"]!, userEmail: dictionary["email"]!, userAbout: dictionary["about"]!, userLatitude: dictionary["lat"]!, userLongitude: dictionary["lng"]!, userGender: dictionary["gender"]!, userStatus: dictionary["status"]!))
                DispatchQueue.main.async {
                    ProgressHUD.dismiss()
                    strongSelf.friendsTableView.reloadData()
                }
            } else {
                ProgressHUD.dismiss()
                Loaf("Unable to fetch friends list at the moment.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: strongSelf).show()
            }
        }
    }
    
    //MARK:- Show Information Label
    func showInfoLabel(message: String) {
        infoLabel.isHidden = false
        friendsTableView.isHidden = true
        infoLabel.text = message
    }
    
    //MARK:- Hide Information Label
    func hideInfoLabel() {
        infoLabel.isHidden = true
        friendsTableView.isHidden = false
    }
    
    //MARK:- Check Chat Existence With Friend
    func checkChatExistence(indexNumber: Int) {
        if isInternetConnected() {
            let myEmail = UserDefaults.standard.string(forKey: "userEmail")!.components(separatedBy: "@").first!
            let userEmail = friendsArray[indexNumber].userEmail.components(separatedBy: "@").first!
            ProgressHUD.animate("Please Wait", interaction: false)
            CoreData.shared().reference().child("ActiveChats").child(myEmail).child(userEmail).observeSingleEvent(of: .value) { [weak self] (snapshot) in
                guard let strongSelf = self else {
                    ProgressHUD.dismiss()
                    return
                }
                if snapshot.exists() {
                    guard let user = snapshot.value as? [String: String] else {
                        ProgressHUD.dismiss()
                        Loaf("Something went wrong.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: strongSelf).show()
                        return
                    }
                    ProgressHUD.dismiss()
                    strongSelf.moveToChatting(indexNumber: indexNumber, chatChannelExists: true, chatChannelId: user["chatChannelId"]!)
                } else {
                    ProgressHUD.dismiss()
                    strongSelf.moveToChatting(indexNumber: indexNumber, chatChannelExists: false, chatChannelId: "")
                }
            }
        } else {
            Loaf("You're not connected to the Internet", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
        }
    }
    
    //MARK:- Move To Chatting
    func moveToChatting(indexNumber: Int, chatChannelExists: Bool, chatChannelId: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChattingVc") as! ChattingVc
        vc.userEmail = friendsArray[indexNumber].userEmail
        vc.userName = friendsArray[indexNumber].userName
        vc.userGender = friendsArray[indexNumber].userGender
        vc.userImg = friendsArray[indexNumber].userImage
        vc.userStatus = friendsArray[indexNumber].userStatus
        vc.userAbout = friendsArray[indexNumber].userAbout
        vc.chatChannelExists = chatChannelExists
        vc.chatChannelId = chatChannelId
        vc.didAppearFirstTime = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:- UITableView Delegates
extension FriendsVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell") as? FriendsCell else {return UITableViewCell()}
        cell.friendImageView.sd_setImage(with: URL(string: friendsArray[indexPath.row].userImage), placeholderImage: #imageLiteral(resourceName: "def"))
        cell.friendNameLabel.text = friendsArray[indexPath.row].userName
        cell.activeStatusLabel.text = friendsArray[indexPath.row].userStatus
        if friendsArray[indexPath.row].userStatus.lowercased() == "online" {
            cell.activeStatusLabel.textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        } else {
            cell.activeStatusLabel.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.checkChatExistence(indexNumber: indexPath.row)
    }
}

