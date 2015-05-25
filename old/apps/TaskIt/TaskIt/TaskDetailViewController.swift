//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Samuel Svenningsen on 9/12/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import Foundation
import UIKit

class TaskDetailViewController:UIViewController {
    
    var detailTaskModel: TaskModel!
    
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        taskTextField.text = detailTaskModel.task
        subtaskTextField.text = detailTaskModel.subtask
        dueDatePicker.date = detailTaskModel.date
    }
}