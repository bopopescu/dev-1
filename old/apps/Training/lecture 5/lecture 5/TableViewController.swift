//
//  TableViewController.swift
//  lecture 5
//
//  Created by Samuel Svenningsen on 10/20/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit
let JSON_URL = "https://raw.githubusercontent.com/cuappdev/trainingProgramResources/master/Lecture5JSON.json"
class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonData: NSData = NSData (contentsOfURL: NSURL(string:JSON_URL))
        
        if let jsonResult = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as? Array<AnyObject> {
            for i in jsonResult {
                println(i)
                var email: [String]
                
                if let e = i["email"] as? [String] {
                    email = e
                }
                else{
                    email = [i["email"] as String]
                }
                
                let person : Person = Person(
                    fname: i["fname"] as String,
                    lname: i["lname"] as String,
                    phone: i["phone"] as String,
                    email: email,
                  picture: i["picture"] as String)
            }
        }
        
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 10
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = "Cell [\(indexPath.section)][\(indexPath.row)]"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
