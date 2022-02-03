//
//  TweetDetailsVC.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 03/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class TweetDetailsVC: UIViewController {
    var tweet: Tweet!
    var comments: [Comment] = []
    

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var tweetImage: UIImageView!
    @IBOutlet weak var tweetLikesNumber: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var commentTable: UITableView!
    @IBOutlet weak var activityLoader: NVActivityIndicatorView!
    @IBOutlet weak var addCommentTextField: CustomStyleTextField!
    @IBOutlet weak var userAddComment: UIStackView!
    
    override func viewDidLoad() {
        
        if ManagingLogs.loggedUser == nil {
            userAddComment.isHidden = true
        }
        commentTable.delegate = self
        commentTable.dataSource = self
        super.viewDidLoad()

        userNameLabel.text = tweet.owner.firstName + " " + tweet.owner.lastName
        tweetLabel.text = tweet.text
        tweetLikesNumber.text = String(tweet.likes)
        publishDateLabel.text = tweet.publishDate
        userProfileImage.makeCircularImage()
        let convertUserProfileImageStringToUrl = tweet.owner.picture
        if let smallImage = convertUserProfileImageStringToUrl {
            userProfileImage.setImageFromStringUrl(stringLink: smallImage)
        }
        
        tweetImage.layer.cornerRadius = 8
        let convertImageStringToUrl = tweet.image
        tweetImage.setImageFromStringUrl(stringLink: convertImageStringToUrl)
        
        // comments of the tweet
        gettingRefreshedComment()
    }
    
    func gettingRefreshedComment() {
        activityLoader.startAnimating()
        TweetAPI.gettingAllComment(id: tweet.id) { commentsRespone in
            self.comments = commentsRespone
            self.commentTable.reloadData()
            self.activityLoader.stopAnimating()
        }
    }
    
    @IBAction func returnButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addCommentButton(_ sender: Any) {
        let newComment = addCommentTextField.text!
        if let logInUser = ManagingLogs.loggedUser {
            TweetAPI.posttingNewCommentOnTweet(tweetId: tweet.id, ownerId: logInUser.id , message: newComment) {
                self.gettingRefreshedComment()
                self.addCommentTextField.text = ""
            }
        }
        
    }
}

extension TweetDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commentCell = tableView.dequeueReusableCell(withIdentifier: "commentCell") as! CommentCell
        
        let currentComment = comments[indexPath.row]
        commentCell.showCommentLabel.text = currentComment.message
        commentCell.commentUserName.text = currentComment.owner.firstName + " " + currentComment.owner.lastName
        commentCell.commentUserImage.makeCircularImage()
        
        if let profilrUserImage = currentComment.owner.picture {
            commentCell.commentUserImage.setImageFromStringUrl(stringLink: profilrUserImage)
        }
        
        return commentCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
