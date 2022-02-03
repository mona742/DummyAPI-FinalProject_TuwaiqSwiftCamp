//
//  UserInfoAPI.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 13/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserInfoAPI: API {
    static func gettingUserProfile(id: String, handler: @escaping (UserInfo) -> ()){
           let link = "\(mainLink)/user/\(id)"
           AF.request(link, headers: headers).responseJSON { res in
               let resData = JSON(res.value)
               let dataDecoding = JSONDecoder()
               do {
                   let userInfo = try dataDecoding.decode(UserInfo.self, from: resData.rawData())
                   handler(userInfo)
               }catch let error{
                   print(error)
               }
           }
    }
    
    static func posttingNewUser(firstName: String, lastName: String, email: String, handler: @escaping (UserInfo?, String?) -> ()){
           
        let link = "\(mainLink)/user/create"
        let params = [
        "lastName": lastName,
        "firstName": firstName,
        "email": email
        ]
        AF.request(link, method: .post, parameters: params, encoder: JSONParameterEncoder.default, headers: headers).validate() .responseJSON { res in
            switch res.result{
            case .success:
                let resData = JSON(res.value)
                let dataDecoding = JSONDecoder()
                do {
                    let userInfo = try dataDecoding.decode(UserInfo.self, from: resData.rawData())
                    handler(userInfo, nil)
                }catch let error{
                    print(error)
                }
            case .failure(let error):
                let resData = JSON(res.data)
                let data = resData["data"]
                let emailError = data["email"].stringValue
                let firstNameError = data["firstName"].stringValue
                let lastNameError = data["lastName"].stringValue
                let errorMessage = emailError + " " + firstNameError + " " + lastNameError
                handler(nil, errorMessage)
                print(emailError)
            }
            
        }
    }
    
    static func signInUser(firstName: String, lastName: String, handler: @escaping (UserInfo?, String?) -> ()){
           
        let link = "\(mainLink)/user?"
        let params = [
            "created": "1"
        ]
        AF.request(link, method: .get, parameters: params, encoder: URLEncodedFormParameterEncoder.default, headers: headers).validate() .responseJSON { res in
            switch res.result{
            case .success:
                let resData = JSON(res.value)
                let data = resData["data"]
                let dataDecoding = JSONDecoder()
                do {
                    let usersInfo = try dataDecoding.decode([UserInfo].self, from: data.rawData())
                    
                    var foundUser: UserInfo?

                    for userInfo in usersInfo {
                        if userInfo.firstName == firstName && userInfo.lastName == lastName {
                            foundUser = userInfo
                            break
                        }
                    }
                    if let user = foundUser {
                        handler(user, nil)
                    }else {
                        handler(nil, "The first Name or Last Name dose not exist!")
                    }
                }catch let error{
                    print(error)
                }
            case .failure(let error):
                let resData = JSON(res.data)
                let data = resData["data"]
                let emailError = data["email"].stringValue
                let firstNameError = data["firstName"].stringValue
                let lastNameError = data["lastName"].stringValue
                let errorMessage = emailError + " " + firstNameError + " " + lastNameError
                handler(nil, errorMessage)
            }
            
        }
    }
    
    static func UpdateUserInfo(userId:String, gender: String, phone: String, pictureURL: String, handler: @escaping (UserInfo?, String?) -> ()){
           
        let link = "\(mainLink)/user/\(userId)"
        let params = [
            "gender": gender,
            "phone": phone,
            "picture": pictureURL
        ]
        AF.request(link, method: .put, parameters: params, encoder: JSONParameterEncoder.default, headers: headers).validate() .responseJSON { res in
            switch res.result{
            case .success:
                let resData = JSON(res.value)
                let dataDecoding = JSONDecoder()
                do {
                    let userInfo = try dataDecoding.decode(UserInfo.self, from: resData.rawData())
                }catch let error{
                    print(error)
                }
            case .failure(let error):
                let resData = JSON(res.data)
                let genderError = resData["gender"].stringValue
                let phoneError = resData["phone"].stringValue
                let pictureURLError = resData["picture"].stringValue
                let errorMessage = genderError + " " + phoneError + " " + pictureURLError
                handler(nil, errorMessage)
            }
            
        }
    }
}
