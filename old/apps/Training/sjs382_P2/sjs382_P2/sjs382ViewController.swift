//
//  ViewController.swift
//  sjs382_P2
//
//  Created by Samuel Svenningsen on 9/28/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var majorField: UITextField!
    @IBOutlet weak var gpaField: UITextField!
    
    @IBOutlet weak var viewField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.viewField.text = "Student Information: \n"
        self.nameField.text = ""
        self.majorField.text = ""
        self.gpaField.text = ""
        self.yearField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(sender: AnyObject) {
        self.viewField.text = self.viewField.text + "\(self.nameField.text) is majoring in \(self.majorField.text) with a \(self.gpaField.text) \n"
        self.nameField.text = ""
        self.majorField.text = ""
        self.gpaField.text = ""
        self.yearField.text = ""
        
    }
}

