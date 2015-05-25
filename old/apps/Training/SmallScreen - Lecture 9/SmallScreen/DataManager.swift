//
//  DataManager.swift
//  SmallScreen
//
//  Created by Eric Appel on 11/17/14.
//  Copyright (c) 2014 Eric Appel. All rights reserved.
//

import Foundation
import Alamofire

let DEBUG = true

let separator = ":------------------------------------------"

enum Router: URLStringConvertible {
    static let baseURLString = "http://api.trakt.tv"
    static let apiKey = "828c0f2ee8013864009de99072005ab1"
    static let format = "json"
    case Root
    case CalendarShows(Int, Int)
    
    var URLString: String {
        let path: String = {
            switch self {
            case .Root:
                return "/"
            case .CalendarShows(let date, let days):
                return "/calendar/shows.\(Router.format)/\(Router.apiKey)/\(date)/\(days)"
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
                    completion(error: e) // send error to completion closure
                } else {
                    if let swiftyJSON = JSON(rawValue: data!) { // if object can be converted to JSON
                        println(swiftyJSON)
                    }
                }
        }
    }
    
    func getShows(ymdDate: Int, days: Int, completion:(error: NSError?, result: [Episode]?) -> Void) {
        println("func getShows()\n")
        Alamofire
            .request(.GET, Router.CalendarShows(ymdDate, days), parameters: nil, encoding: .URL)
            .responseJSON { (request : NSURLRequest, response: NSHTTPURLResponse?, data: AnyObject?, error: NSError?) -> Void in
                printNetworkResponse(request, response, data, error)
                if error != nil {
                    completion(error: error!, result: nil)
                } else {
                    // Implement me!
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
            println("JSON DATA" + separator) // raw json
            println(data)
            if let swiftyJSON = JSON(rawValue: data!) { // if JSON data can be converted to swiftyJSON
                println("SWIFTY JSON" + separator) // SwiftyJSON
                println(swiftyJSON)
            }
        }
        println("end " + separator)
    }
}


