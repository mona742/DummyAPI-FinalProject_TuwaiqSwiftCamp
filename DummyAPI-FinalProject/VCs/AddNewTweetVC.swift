//
//  AddNewTweetVC.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 23/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class AddNewTweetVC: UIViewController {

    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetText: UITextView!
    @IBOutlet weak var tweetImage: UITextField!
    @IBOutlet weak var activityLoader: NVActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userProfileImage.makeCircularImage()
        if let userLogged = ManagingLogs.loggedUser {
            if let profileImage = userLogged.picture {
                userProfileImage.setImageFromStringUrl(stringLink: profileImage)
            }
            userNameLabel.text = userLogged.firstName + " " + userLogged.lastName
    }
}
    
    @IBAction func addNewTweetButton(_ sender: Any) {
        activityLoader.startAnimating()
        if let userLogged = ManagingLogs.loggedUser {
            TweetAPI.posttingNewTweet(tweetText: tweetText.text!, ownerId: userLogged.id, tweetImage: tweetImage.text!) {
                self.activityLoader.stopAnimating()
                NotificationCenter.default.post(name: NSNotification.Name("AddingNewTweet"), object: nil, userInfo: nil)
                
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func exitButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
