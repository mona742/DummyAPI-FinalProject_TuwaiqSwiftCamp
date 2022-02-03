//
//  API.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 13/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import Foundation
import Alamofire
class API {
    static let mainLink = "https://dummyapi.io/data/v1"
    static let apiKey = "61f2d66182f2d18c963de79f"
    static let headers: HTTPHeaders = [
        "app-id" : apiKey
    ]
}
