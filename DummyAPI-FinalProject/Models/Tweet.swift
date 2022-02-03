//
//  Tweet.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 24/05/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import Foundation
import UIKit

struct Tweet: Decodable {
    var id: String
    var image: String
    var likes: Int
    var text: String
    var publishDate: String
    var owner: UserInfo
    var tags: [String]?
    

}
