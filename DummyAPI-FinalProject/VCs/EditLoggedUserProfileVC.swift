//
//  EditLoggedUserProfileVC.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 25/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class EditLoggedUserProfileVC: UIViewController {

    //MARK: OUTLET
    @IBOutlet weak var profileImageURLTextField: UITextField!
    @IBOutlet weak var userPhoneTextField: UITextField!
    @IBOutlet weak var userGenderTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var activityLoader: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
        userProfileImage.makeCircularImage()
    }
    
    func setUpUI() {
        if let userLogged = ManagingLogs.loggedUser {
            if let profileImage = userLogged.picture {
                userProfileImage.setImageFromStringUrl(stringLink: profileImage)
            }
            userNameLabel.text = userLogged.firstName + " " + userLogged.lastName
            
            userEmailTextField.text = userLogged.email
            userGenderTextField.text = userLogged.gender
            userPhoneTextField.text = userLogged.phone
            profileImageURLTextField.text = userLogged.picture
        }
    }
    
    //MARK: ACTION
    @IBAction func editButton(_ sender: Any) {
        activityLoader.startAnimating()
        
        guard let loggedUsre = ManagingLogs.loggedUser else {return}
        
        UserInfoAPI.UpdateUserInfo(userId: loggedUsre.id, gender: userGenderTextField.text!, phone: userPhoneTextField.text!, pictureURL: profileImageURLTextField.text!) { (user, message) in
            if let respons = user {
                self.activityLoader.stopAnimating()
                if let imageProfile = respons.picture {
                    self.userProfileImage.setImageFromStringUrl(stringLink: imageProfile)
                }
                self.userGenderTextField.text = respons.gender
                self.userPhoneTextField.text = respons.phone
            }
        }
    }
    


}
