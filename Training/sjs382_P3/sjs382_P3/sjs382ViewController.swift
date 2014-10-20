//
//  ViewController.swift
//  sjs382_P3
//
//  Created by Samuel Svenningsen on 10/5/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class sjs382ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeNav(sender: AnyObject) {
        navigationController?.navigationBarHidden = true
    }
    @IBAction func unwindVC(sender:UIStoryboardSegue){
        
    }

}

