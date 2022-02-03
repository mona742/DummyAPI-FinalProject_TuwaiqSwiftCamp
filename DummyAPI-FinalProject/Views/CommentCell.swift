//
//  CommentCell.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 05/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var showCommentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var commentUserImage: UIImageView!
    @IBOutlet weak var commentUserName: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
