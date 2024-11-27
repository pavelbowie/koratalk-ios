//
//  ActiveChatsVc.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 17/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
import SDWebImage
import Loaf
import ProgressHUD

class ActiveChatsVc: BaseVc {
    
    @IBOutlet weak var activeChatsTableView: UITableView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var activeChatsArray = [ActiveChatsModel]()
    
    @IBOutlet weak var menu: DropDownMenu!
    
    let meals = [
        Meal(name: "Работа", image: #imageLiteral(resourceName: "c1")),
        Meal(name: "Мероприятия", image: #imageLiteral(resourceName: "c2")),
        Meal(name: "Друзья", image: #imageLiteral(resourceName: "c4")),
        Meal(name: "Спорт", image: #imageLiteral(resourceName: "c3"))
    ]
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.colorAnimation = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        ProgressHUD.animationType = .circleRotateChase
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
        
        setupMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getActiveChatsFromDataServer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    private func setupMenu() {
        menu.configure { [unowned self] configurator in
            configurator.cellClass(CustomDropDownCellWithoutNib.self)
                        .numberOfItems(self.meals.count)
                        .updateThumbnailOnSelection(false)
                        .didSelectItem { index in
                            let meal = self.meals[index]
                            self.navigationItem.title = meal.name
                            //self.imageView.image = meal.image
                        }
                        .willDisplayCell { (cell, index) in
                            let meal = self.meals[index]
                            if let cell = cell as? CustomDropDownCellWithoutNib {
                                cell.configureUsing(meal)
                            }
                        }
        }
    }
    
    //MARK:- Fetch Active Chats
    func getActiveChatsFromDataServer() {
        if isInternetConnected() {
            self.hideInfoLabel()
            self.activeChatsArray.removeAll()
            let myEmail = UserDefaults.standard.string(forKey: "userEmail")!.components(separatedBy: "@").first!
            ProgressHUD.animate("Please Wait", interaction: false)
            CoreData.shared().reference().child("ActiveChats").child(myEmail).observeSingleEvent(of: .value) { [weak self] (snapshot) in
                guard let strongSelf = self else {
                    ProgressHUD.dismiss()
                    return
                }
                if snapshot.exists() {
                    for child in snapshot.children {
                        if let childSnapshot = child as? DataSnapshot,
                           let dictionary = childSnapshot.value as? [String:Any] {
                            let email = dictionary["email"] as! String
                            let lastMsg = dictionary["lastMsg"] as! String
                            let dateAndTime = dictionary["dateAndTime"] as! String
                            let chatChannelId = dictionary["chatChannelId"] as! String
                            strongSelf.getFriendDetail(email: email,lastMsg: lastMsg, dateAndTime: dateAndTime, chatChannelId: chatChannelId)
                        }
                    }
                } else {
                    ProgressHUD.dismiss()
                    strongSelf.showInfoLabel(message: "You don't have any active chats.")
                }
            }
        } else {
            self.showInfoLabel(message: "You're not connected to the Internet")
        }
    }
    
    //MARK:- Get detail about friends
    func getFriendDetail(email: String, lastMsg: String, dateAndTime: String, chatChannelId: String) {
        CoreData.shared().reference().child("Users").child(email).observeSingleEvent(of: .value) { [weak self] (snapshot) in
            guard let strongSelf = self else {
                ProgressHUD.dismiss()
                return
            }
            if snapshot.exists() {
                guard let dictionary = snapshot.value as? [String: String] else {
                    ProgressHUD.dismiss()
                    Loaf("Unable to fetch active chats at the moment.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: strongSelf).show()
                    return
                }
                strongSelf.activeChatsArray.append(ActiveChatsModel(userName: dictionary["username"]!, userImage: dictionary["image"]!, userEmail: dictionary["email"]!, userAbout: dictionary["about"]!, userLatitude: dictionary["lat"]!, userLongitude: dictionary["lng"]!, userGender: dictionary["gender"]!, userStatus: dictionary["status"]!, userLastMsg: lastMsg, msgDateAndTime: dateAndTime, chatChannelId: chatChannelId))
                
                DispatchQueue.main.async {
                    ProgressHUD.dismiss()
                    strongSelf.activeChatsTableView.reloadData()
                }
            } else {
                ProgressHUD.dismiss()
                Loaf("Unable to fetch active chats at the moment.", state: .info, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: strongSelf).show()
            }
        }
    }
    
    //MARK:- Show Information Label
    func showInfoLabel(message: String) {
        infoLabel.isHidden = false
        activeChatsTableView.isHidden = true
        infoLabel.text = message
    }
    
    //MARK:- Hide Information Label
    func hideInfoLabel() {
        infoLabel.isHidden = true
        activeChatsTableView.isHidden = false
    }
}

//MARK:- UITableView Delegates
extension ActiveChatsVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeChatsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActiveChatsCell") as? ActiveChatsCell else {return UITableViewCell()}
        cell.friendImageView.sd_setImage(with: URL(string: activeChatsArray[indexPath.row].userImage), placeholderImage: #imageLiteral(resourceName: "def"))
        cell.friendNameLabel.text = activeChatsArray[indexPath.row].userName
        cell.lastMessageLabel.text = activeChatsArray[indexPath.row].userLastMsg
        cell.dateAndTimeLabel.text = activeChatsArray[indexPath.row].msgDateAndTime
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChattingVc") as! ChattingVc
        vc.userEmail = activeChatsArray[indexPath.row].userEmail
        vc.userName = activeChatsArray[indexPath.row].userName
        vc.userGender = activeChatsArray[indexPath.row].userGender
        vc.userImg = activeChatsArray[indexPath.row].userImage
        vc.userStatus = activeChatsArray[indexPath.row].userStatus
        vc.userAbout = activeChatsArray[indexPath.row].userAbout
        vc.chatChannelExists = true
        vc.didAppearFirstTime = true
        vc.chatChannelId = activeChatsArray[indexPath.row].chatChannelId
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

