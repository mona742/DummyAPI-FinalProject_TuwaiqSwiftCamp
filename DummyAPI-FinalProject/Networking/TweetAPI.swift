//
//  TweetAPI.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 10/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TweetAPI: API {
    
    static func gettingAllTweets(page: Int, selectedTag: String?, completionHandler: @escaping ([Tweet], Int) -> ()){
        var link = mainLink + "/post"
        if var noWiteSpaceTag = selectedTag {
            noWiteSpaceTag = noWiteSpaceTag.trimmingCharacters(in: .whitespaces)
            link = "\(mainLink)/tag/\(noWiteSpaceTag)/post"
        }
        let paramsPage = [
            "page": "\(page)",
            "limit": "5"
        ]
        AF.request(link, parameters: paramsPage,encoder: URLEncodedFormParameterEncoder.default ,headers: headers).responseJSON { res in
            let resData = JSON(res.value)
            let tweetData = resData["data"]
            let tweetTotal = resData["total"].intValue
            let dataDecoding = JSONDecoder()
            do {
                let tweets = try dataDecoding.decode([Tweet].self, from: tweetData.rawData())
                completionHandler(tweets, tweetTotal)
            }catch let error{
                print(error)
            }
        }
    }
    
    //MARK: CREAT TWEET API
    static func posttingNewTweet(tweetText: String, ownerId: String,tweetImage:String, handler: @escaping () -> ()){
           
        let link = "\(mainLink)/post/create"
        let params = [
        "owner": ownerId,
        "text": tweetText,
        "image": tweetImage
        ]
        AF.request(link, method: .post, parameters: params, encoder: JSONParameterEncoder.default, headers: headers).validate() .responseJSON { res in
            switch res.result{
            case .success:
                handler()
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    
    static func gettingAllComment(id: String, handler: @escaping ([Comment]) -> ()){
        let link = "\(mainLink)/post/\(id)/comment"
            AF.request(link, headers: headers).responseJSON { res in
                let resData = JSON(res.value)
                let commentData = resData["data"]
                let dataDecoding = JSONDecoder()
                do {
                    let comments = try dataDecoding.decode([Comment].self, from: commentData.rawData())
                    handler(comments)

                }catch let error{
                    print(error)
                }
        }
    }
    
    //MARK: TAGS API
    static func gettingAllTags(completionHandler: @escaping ([String]) -> ()){
        let link = mainLink + "/tag"
        AF.request(link, headers: headers).responseJSON { res in
            let resData = JSON(res.value)
            let tagsData = resData["data"]
            let dataDecoding = JSONDecoder()
            do {
                let tags = try dataDecoding.decode([String].self, from: tagsData.rawData())
                completionHandler(tags)
            }catch let error{
                print(error)
            }
        }
    }
    
    //MARK: COMMENT API
    static func posttingNewCommentOnTweet(tweetId: String, ownerId: String, message: String, handler: @escaping () -> ()){
           
        let link = "\(mainLink)/comment/create"
        let params = [
        "message": message,
        "owner": ownerId,
        "post": tweetId
        ]
        AF.request(link, method: .post, parameters: params, encoder: JSONParameterEncoder.default, headers: headers).validate() .responseJSON { res in
            switch res.result{
            case .success:
                handler()
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}
