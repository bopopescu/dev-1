//
//  FeedTableViewCell.swift
//  RedditClient
//
//  Created by Eric Appel on 11/10/14.
//  Copyright (c) 2014 Eric Appel. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subredditLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    func setItem(item: RedditItem) {
        if item.thumbnailImage != nil {
            thumbnailImageView.image = item.thumbnailImage
        } else {
            if let imageData = NSData(contentsOfURL: item.thumbnailURL) {
                if let image = UIImage(data: imageData) {
                    thumbnailImageView.image = image
                    item.thumbnailImage = image
                }
            }
            else {
                thumbnailImageView.image = nil
            }
        }
        
        titleLabel.text = item.title
        subredditLabel.text = "r/\(item.subreddit)"
        authorLabel.text = "a:\(item.author)"
        commentsLabel.text = "c:\(item.numComments.description)"
        scoreLabel.text = "s:\(item.score.description)"
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
