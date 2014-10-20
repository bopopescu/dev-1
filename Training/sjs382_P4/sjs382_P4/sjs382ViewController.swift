//
//  ViewController.swift
//  sjs382_P4
//
//  Created by Samuel Svenningsen on 10/19/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class sjs382ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var names = ["Evan", "Paul", "Mark", "Nikki", "Jordan", "Dylan"]
    var ages  = ["20","19","22","28","21","23"]
    var enemies = ["Reiss", "Kenny", "Bobo", "Trixie", "Joffrey"]
    var en_ages = ["100", "34", "32", "16", "a twat"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Friend"
        }
        else{
            return "Foe"
        }
    }
    
    // MARK: UITableViewDataSource methods
    // Required to implement so the UITableView can determine how many rows to display
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return names.count
        }
        else{
            return enemies.count
        }
    }
    
    // Required to implement so the UITableView can display the proper information in a cell given its indexPath
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        if(indexPath.section == 0){
            cell.textLabel?.text = names[indexPath.row] + " is " + ages[indexPath.row] + " years old"
            cell.imageView?.image = UIImage(named: "sjs382patrickbio.jpg")
        }
        else{
            cell.textLabel?.text = enemies[indexPath.row] + " is " + en_ages[indexPath.row] + " years old"
            cell.imageView?.image = UIImage(named: "sjs382joffrey.jpg")
        }
        return cell
    }
    
    // MARK: UITableViewDelegate methods
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(40 + (indexPath.row % 2) * 20)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.reloadData()
    }
    
    // Called when we are preparing to take a segue
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // If we take the DetailSegue, we will find the row selected and take the name at that index.
//        if segue.identifier == "DetailSegue" {
//            let row = tableView.indexPathForSelectedRow()?.row
//            let destinationVC = segue.destinationViewController as sjs382ViewController
//            destinationVC.name = names[row!]
//        }
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

