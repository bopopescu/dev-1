//
//  Show.swift
//  SmallScreen
//
//  Created by Eric Appel on 11/17/14.
//  Copyright (c) 2014 Eric Appel. All rights reserved.
//

import UIKit

class Show: NSObject {
    let title: String
    let network: String
    let bannerURL: NSURL?
    var bannerImage: UIImage?
    dynamic let ratings: Float

    
    init(data: JSON) {
        title = data["title"].stringValue
        network = data["network"].stringValue
        if let url = data["images"]["banner"].string {
            bannerURL = NSURL(string: url)
        }
        
        ratings = data["ratings"]["loved"].floatValue
    }
    
    
    
}