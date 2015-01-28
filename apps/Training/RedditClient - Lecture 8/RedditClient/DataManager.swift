//
//  DataManager.swift
//  RedditClient
//
//  Created by Eric Appel on 11/10/14.
//  Copyright (c) 2014 Eric Appel. All rights reserved.
//

import Foundation
import Alamofire

let DEBUG = true

let separator = ":------------------------------------------"

enum Router: URLStringConvertible {
    static let baseURLString = "http://www.reddit.com"
    case Root
    case Subreddit(String)
    
    var URLString: String {
        let path: String = {
            switch self {
            case .Root:
                return "/.json"
            case .Subreddit(let subRedditTitle):
                return "/r/\(subRedditTitle)/.json"
            }
            }()
        return Router.baseURLString + path
    }
}

class DataManager: NSObject {
    
    class var sharedInstance : DataManager {
        struct Static {
            static var instance: DataManager = DataManager()
        }
        return Static.instance
    }
    
    func alamoTest(completion:(error: NSError?) -> Void) {
        println("\nfunc alamoTest()")
        let parameters = [
            "foo" : "bar"
        ]
        Alamofire
            .request(.GET, "http://httpbin.org/get", parameters: parameters, encoding: .URL)
            .responseJSON { (request : NSURLRequest, response: NSHTTPURLResponse?, data: AnyObject?, error: NSError?) -> Void in
                
                printNetworkResponse(request, response, data, error)
                
                if let e = error {
                
                    completion(error: e) // send error to completion block
                
                } else {
                
                    if let swiftyJSON = JSON(rawValue: data!) { // if 'data' can be converted to the JSON type from swiftyJSON
                    
                        println(swiftyJSON)
                        
                        println(swiftyJSON["headers"]["Host"])
                    }
                }
        }
    }
    
    func getFrontPage(completion:(error: NSError?, result: [RedditItem]?) -> Void) {
        println("func getFrontPage()\n")
        Alamofire
            .request(.GET, Router.Root, parameters: nil, encoding: .URL)
            .responseJSON { (request : NSURLRequest, response: NSHTTPURLResponse?, data: AnyObject?, error: NSError?) -> Void in
                
                if error != nil {
                    
                    completion(error: error!, result: nil)
                    
                } else {
                    
                    if let swiftyJSON = JSON(rawValue: data!) {
                        
                        let children = swiftyJSON["data"]["children"].arrayValue // pull out the array from the JSON
                        
                        var returnArray: [RedditItem] = []
                        
                        for child in children {
                            let item = RedditItem(json: child)  // convert element to our model object
                            returnArray.append(item)
                        }
                        
                        completion(error: nil, result: returnArray)
                    }
                }
        }
    }
    
    func getSubredditPage(subreddit: String, completion:(error: NSError?, result: [RedditItem]?) -> Void) {
        println("func getSubredditPage(r/\(subreddit))\n")
        Alamofire
            .request(.GET, Router.Subreddit(subreddit), parameters: nil, encoding: .URL)
            .responseJSON { (request : NSURLRequest, response: NSHTTPURLResponse?, data: AnyObject?, error: NSError?) -> Void in
                
                if error != nil {
                    
                    completion(error: error!, result: nil)
                    
                } else {
                    
                    if let swiftyJSON = JSON(rawValue: data!) {
                        
                        let children = swiftyJSON["data"]["children"].arrayValue
                        
                        var returnArray: [RedditItem] = []
                        
                        for child in children {
                            let item = RedditItem(json: child)
                            returnArray.append(item)
                        }
                        
                        completion(error: nil, result: returnArray)
                    }
                }
        }
    }

    
}

func printNetworkResponse(request: NSURLRequest, response: NSHTTPURLResponse?, data: AnyObject?, error: NSError?) {
    if DEBUG {
        if error != nil {
            println("ERROR" + separator)
            println(error)
            println("REQUEST" + separator)
            println(request)
            println("RESPONSE" + separator)
            println(response)
        } else {
            println("ERROR" + separator)
            println(error)
            println("REQUEST" + separator)
            println(request)
            println("RESPONSE" + separator)
            println(response)
            println("JSON DATA" + separator)
            println(data)
            if let swiftyJSON = JSON(rawValue: data!) {
                println("SWIFTY JSON" + separator)
                println(swiftyJSON)
            }
        }
        println("end " + separator)
    }
}

