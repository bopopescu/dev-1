//
//  ShapeViewController.swift
//  navigator
//
//  Created by Samuel Svenningsen on 9/29/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class ShapeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellowColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let location = touches.anyObject()!.locationInView(view)
        let redView = UIView(frame: CGRectMake(0,0,25,50))
        redView.center = location
        redView.backgroundColor = UIColor.redColor()
        redView.layer.cornerRadius = 10
        redView.layer.shadowOpacity = 1
        redView.layer.shadowColor = UIColor.blackColor().CGColor
        redView.layer.shadowOffset = CGSizeMake(10, 5)
        view.addSubview(redView)
    }

}
