//
//  FeedTableViewController.swift
//  RedditClient
//
//  Created by Eric Appel on 11/10/14.
//  Copyright (c) 2014 Eric Appel. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    
    var redditItems: [RedditItem] = []

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.backgroundColor = UIColor.cuappdevGreen()
        
        activityIndicator.startAnimating()
        
        DataManager.sharedInstance.getFrontPage { (error, result) -> Void in
            self.activityIndicator.stopAnimating()
            if error != nil {
                println("ERRORERRORERRORERRORERROR")
                println(error)
                error!.showAlert()
            } else {
                println("completion")
                
                self.redditItems = result!
                self.tableView.reloadData()
                
            }
        }
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return redditItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as FeedTableViewCell
        
        cell.setItem(redditItems[indexPath.row])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let webViewController = WebViewController()
        webViewController.url = redditItems[indexPath.row].linkURL
        navigationController?.pushViewController(webViewController, animated: true)
    }
}
