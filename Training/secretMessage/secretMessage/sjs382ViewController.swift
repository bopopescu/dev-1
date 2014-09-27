//
//  ViewController.swift
//  secretMessage
//
//  Created by Samuel Svenningsen on 9/21/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hiddenText: UILabel!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func revealPressed(sender: AnyObject) {
        if (self.userText.text == "username" && self.passText.text == "password"){
            self.hiddenText.text = "You unlocked the secret message"
        }
        else{
            self.hiddenText.text = "Keep trying"
        }
    }
}

