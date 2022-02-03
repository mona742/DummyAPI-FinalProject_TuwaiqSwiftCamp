//
//  Comment.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 03/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import Foundation

struct Comment: Decodable {
    var id: String
    var message: String
    var owner: UserInfo
}
