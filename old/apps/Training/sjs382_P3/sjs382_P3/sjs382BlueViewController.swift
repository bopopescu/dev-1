//
//  BlueViewController.swift
//  sjs382_P3
//
//  Created by Samuel Svenningsen on 10/5/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//
import UIKit

class sjs382BlueViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let location = touches.anyObject()!.locationInView(view)
        let blueView = UIView(frame: CGRectMake(0,0,25,25))
        blueView.center = location
        blueView.backgroundColor = UIColor.blueColor()
        view.addSubview(blueView)
    }
    
}