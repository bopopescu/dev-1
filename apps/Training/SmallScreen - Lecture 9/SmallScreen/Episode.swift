//
//  Episode.swift
//  SmallScreen
//
//  Created by Eric Appel on 11/17/14.
//  Copyright (c) 2014 Eric Appel. All rights reserved.
//

import UIKit

class Episode: NSObject {
    let show: Show
    let season: Int
    let airDate: NSDate?
    let airTime: String?
    let episodeNumber: Int
    override var description: String {
        return "\n<<<<<\n    \(show.title) - s\(season)e\(episodeNumber)\n    \(airDate) || \(airTime)\n    \(show.network) \(show.ratings)\n    \(show.bannerURL)"
    }
    
    init(data: JSON, show: JSON) {
        season = data["season"].intValue
        episodeNumber = data["number"].intValue
        self.show = Show(data: show)
        
        var dateFormat: NSDateFormatter {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyyy-MM-dd'T'HH:mm:ssZZZZZ"
            return formatter
        }
        airDate = dateFormat.dateFromString(data["first_aired_iso"].stringValue)
        
        var timeFormat: NSDateFormatter {
            let formatter = NSDateFormatter()
            formatter.timeZone = NSTimeZone.localTimeZone()
            formatter.dateFormat = "h:mma"
            return formatter
        }
        if let date = airDate {
            airTime = timeFormat.stringFromDate(date)
        }
        
    }
    
    
    
}
