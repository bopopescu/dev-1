//
//  ViewController.swift
//  Lecture 1
//
//  Created by Samuel Svenningsen on 9/15/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("Hello World!")
    }

    @IBAction func buttonTapped(sender: UIButton) {
        label.text = "I got pressed!"
        label.textColor = UIColor.redColor()
    }
}

