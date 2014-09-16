//
//  ViewController.swift
//  TaskIt
//
//  Created by Samuel Svenningsen on 9/12/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var taskArray: [TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let task1 = TaskModel(task:"I'm walking somewhere.", subtask: "Tap to set up your virtual escort")
        let task2 = TaskModel(task:"I just witnessed a crime.", subtask: "Tap to report anonymously")
        let task3 = TaskModel(task:"I need a safe ride.", subtask: "Tap to reserve a spot in our campus van")
        let task4 = TaskModel(task:"I need to talk to someone", subtask: "Tap to connect to our 24 hour safety hotline")
        let task5 = TaskModel(task:"I want to be informed", subtask: "Tap to view real-time safety adisements")
        
        
        taskArray = [task1, task2, task3, task4, task5]
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC:TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
            
            
            
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("\(indexPath.row)")
        var cell:TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let thisTask = taskArray[indexPath.row]
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("\(indexPath.row)")
        self.performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
}

