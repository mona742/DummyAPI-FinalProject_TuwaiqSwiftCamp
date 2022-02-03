//
//  UserInfo.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 24/05/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import Foundation
import UIKit

struct UserInfo: Decodable {
    var id: String
    var firstName: String
    var lastName: String
    var picture: String?
    var gender: String?
    var email: String?
    var phone: String?
    var location: Location?
    var registerDate: String?
}
