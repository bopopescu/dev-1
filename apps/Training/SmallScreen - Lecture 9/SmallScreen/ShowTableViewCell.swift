//
//  ShowTableViewCell.swift
//  SmallScreen
//
//  Created by Eric Appel on 11/17/14.
//  Copyright (c) 2014 Eric Appel. All rights reserved.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var showImageView: UIImageView!
    
    override func awakeFromNib() {
        backgroundColor = UIColor.clearColor()
        contentView.backgroundColor = UIColor.clearColor()
    }
    
    
    func setEpisode(ep: Episode) {
        titleLabel.text = ep.show.title
        timeLabel.text = ep.airTime
        
        if let url = ep.show.bannerURL {
            loadImage(url, ep: ep)

        }
    }
    
    func loadImage(url: NSURL, ep: Episode) {
        if let image = ep.show.bannerImage {
            self.showImageView.image = ep.show.bannerImage
        } else {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                ep.show.bannerImage = UIImage(data: NSData(contentsOfURL: url)!)
                self.showImageView.image = ep.show.bannerImage
            })
        }
    }
}
