//
//  TweetCell.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 24/05/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    var tags: [String] = []
    
    // MARK: OUTLETS
    @IBOutlet weak var tagTweetCollectionView: UICollectionView!{
        didSet{
            tagTweetCollectionView.dataSource = self
            tagTweetCollectionView.delegate = self
        }
    }
    @IBOutlet weak var userProfileSV: UIStackView! {
        didSet{
            userProfileSV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userProfileTapped)))
        }
    }
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var backgroudView: UIView!
    @IBOutlet weak var userSmallImage: UIImageView!
    @IBOutlet weak var tweetImage: UIImageView!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var likeNumberLebel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func userProfileTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("userProfileTapped"), object: nil, userInfo: ["cell": self])
    }

}

extension TweetCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TweetTagCell", for: indexPath) as! TweetTagCell
        tagCell.tweetTagLabel.text = tags[indexPath.row]
        return tagCell
    }
    
    
}
