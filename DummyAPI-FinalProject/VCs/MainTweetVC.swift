//
//  ViewController.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 24/05/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MainTweetVC: UIViewController {
    
    var tweets: [Tweet] = []
    var tagId: String?
    var page = 0
    var total = 0

    @IBOutlet weak var tweetTable: UITableView!
    @IBOutlet weak var activityLoader: NVActivityIndicatorView!
    @IBOutlet weak var welcomUserLabel: UILabel!
    @IBOutlet weak var tagClicedLabel: UILabel!
    @IBOutlet weak var tagBackground: CustomShadow!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var addNewTweetButton: CustomStyleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTable.dataSource = self
        tweetTable.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(addingNewTweet), name: NSNotification.Name(rawValue: "AddingNewTweet"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(userProfileSVTapped), name: NSNotification.Name(rawValue: "userProfileTapped"), object: nil)
        
        if let userName = ManagingLogs.loggedUser {
            welcomUserLabel.text = "Welcome, \(userName.firstName)"
        }else{
            welcomUserLabel.isHidden = true
            addNewTweetButton.isHidden = true
            removeTab(at: 2)
        }
        
        getAllTweet()
        
        if let selectTag = tagId {
            tagClicedLabel.text = selectTag
            addNewTweetButton.isHidden = true
        }else {
            tagBackground.isHidden = true
            tagClicedLabel.isHidden = true
            exitButton.isHidden = true
        }
        
    }
    
    func removeTab(at index: Int) {
        guard var viewControllers = self.tabBarController?.viewControllers else { return }
        viewControllers.remove(at: 2)
        self.tabBarController?.viewControllers = viewControllers
    }
    
    func getAllTweet() {
        activityLoader.startAnimating()
        TweetAPI.gettingAllTweets(page: page, selectedTag: tagId) { tweetsRespone, totalTweet in
            self.total = totalTweet
            self.tweets.append(contentsOf: tweetsRespone)
            self.tweetTable.reloadData()
            self.activityLoader.stopAnimating()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logOutSeg" {
            ManagingLogs.loggedUser = nil
        }
    }
    
    @objc func addingNewTweet() {
        self.tweets = []
        self.page = 0
        getAllTweet()
    }
    
    @objc func userProfileSVTapped(notification: Notification) {
        if let cell = notification.userInfo?["cell"] as? UITableViewCell {
            if let indexPath = tweetTable.indexPath(for: cell){
                let tweet = tweets[indexPath.row]
                let vc = storyboard?.instantiateViewController(withIdentifier: "userProfileVC") as! UserProfileVC
                vc.userInfo = tweet.owner
                present(vc, animated: true, completion: nil)
            }
            
        }
    }

    @IBAction func exitClickTagButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MainTweetVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tweetCell = tweetTable.dequeueReusableCell(withIdentifier: "tweetCell") as! TweetCell
        
        let tweet = tweets[indexPath.row]
        
        // show user name
        tweetCell.userNameLabel.text = tweet.owner.firstName + " " + tweet.owner.lastName
        
        // show the profile user's image
        let convertUserProfileImageStringToUrl = tweet.owner.picture
        tweetCell.userSmallImage.makeCircularImage()
        if let smallImage = convertUserProfileImageStringToUrl {
            tweetCell.userSmallImage.setImageFromStringUrl(stringLink: smallImage)
        }
        
        // show the text of the tweet
        tweetCell.tweetLabel.text = tweet.text
        
        // show the image of every tweet for each user
        tweetCell.tweetImage.layer.cornerRadius = 8
        let convertImageStringToUrl = tweet.image
        tweetCell.tweetImage.setImageFromStringUrl(stringLink: convertImageStringToUrl)
        
        tweetCell.likeNumberLebel.text = String(tweet.likes)
        
        tweetCell.publishDateLabel.text = tweet.publishDate
        
        tweetCell.tags = tweet.tags ?? []
        
        return tweetCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 590
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let didSelectTweet = tweets[indexPath.row]
        let vc = storyboard?.instantiateViewController(identifier: "tweetDetailsVC") as! TweetDetailsVC
        vc.tweet = didSelectTweet
        
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == tweets.count - 1 && tweets.count < total {
            page = page + 1
            getAllTweet()
        }
    }
}
