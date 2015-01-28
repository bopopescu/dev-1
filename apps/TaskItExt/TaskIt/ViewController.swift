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
        
        var date1 = Date.from(year: 2014, month: 09, day: 20)
        var date2 = Date.from(year: 2014, month: 07, day: 6)
        var date3 = Date.from(year: 2014, month: 12, day: 25)
        let task1 = TaskModel(task:"Study French", subtask: "Verbs", date:date1)
        let task2 = TaskModel(task:"Eat Dinner", subtask: "Burgers", date:date2)
        
        
        taskArray = [task1, task2, TaskModel(task:"Gym",subtask: "Leg Day", date:date3)]
        
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
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("\(indexPath.row)")
        self.performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
}

