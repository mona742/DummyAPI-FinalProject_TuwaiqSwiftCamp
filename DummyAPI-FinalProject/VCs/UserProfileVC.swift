//
//  UserProfileVC.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 10/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class UserProfileVC: UIViewController {

    var userInfo: UserInfo!
    
    @IBOutlet weak var userProfileImage: UIImageView!{
        didSet{
            userProfileImage.makeCircularImage()
        }
    }
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userGenderLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    @IBOutlet weak var userCountryLabel: UILabel!
    @IBOutlet weak var userRegisterDateLabel: UILabel!
    @IBOutlet weak var activityLoader: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUserProfilePage()
        activityLoader.startAnimating()
        UserInfoAPI.gettingUserProfile(id: userInfo.id) { (userInfoRespons) in
            self.userInfo = userInfoRespons
            self.settingUserProfilePage()
            self.activityLoader.stopAnimating()
        }
//        let apiKey = "61cae4babb24650339f4ec0e"
//        let link = "https://dummyapi.io/data/v1/user/\(userInfo.id)"
//        
//        let headers: HTTPHeaders = [
//            "app-id" : apiKey
//        ]
//        //activityLoader.startAnimating()
//        AF.request(link, headers: headers).responseJSON { res in
//            //self.activityLoader.stopAnimating()
//            let resData = JSON(res.value)
//            
//            let dataDecoding = JSONDecoder()
//            do {
//                self.userInfo = try dataDecoding.decode(UserInfo.self, from: resData.rawData())
//                self.settingUserProfilePage()
//                
//            }catch let error{
//                print(error)
//            }
//        }
    }
    
    func settingUserProfilePage(){
        userNameLabel.text = userInfo.firstName + " " + userInfo.lastName
        
        if let smallImage = userInfo.picture {
            userProfileImage.setImageFromStringUrl(stringLink: smallImage)
        }
        
        
        userGenderLabel.text = userInfo.gender
        
        userEmailLabel.text = userInfo.email
        
        userPhoneLabel.text = userInfo.phone
        
        if let location = userInfo.location {
            userCountryLabel.text = location.city! + " - " + location.country!
        }
        
        
        userRegisterDateLabel.text = userInfo.registerDate
    }

}
