//
//  TagsVC.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 17/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class TagsVC: UIViewController {

    var tag:[String] = []
    
    @IBOutlet weak var tagsCollection: UICollectionView!
    @IBOutlet weak var activityLoader: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tagsCollection.dataSource = self
        tagsCollection.delegate = self
        activityLoader.startAnimating()
        TweetAPI.gettingAllTags { (tag) in
            self.tag = tag
            self.tagsCollection.reloadData()
            self.activityLoader.stopAnimating()
        }
    }
    
}

extension TagsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tag.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        
        let currentTag = tag[indexPath.row]
        tagCell.tagNameLabel.text = currentTag
        
        return tagCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let didSelectTag = tag[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "mainTweetVC") as! MainTweetVC
        vc.tagId = didSelectTag
        present(vc, animated: true, completion: nil)
    }
}
