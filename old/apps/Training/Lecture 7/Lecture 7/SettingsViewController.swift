//
//  SettingsViewController.swift
//  Lecture 7
//
//  Created by Samuel Svenningsen on 11/3/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    override func viewWillAppear(animated: Bool) {
        segmentedControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey("filterChoice")
        slider.value = NSUserDefaults.standardUserDefaults().floatForKey("filterValue")
    }
    
    @IBAction func changeFilter(sender: UISegmentedControl) {
        NSUserDefaults.standardUserDefaults().setInteger(segmentedControl.selectedSegmentIndex, forKey: "filterChoice")
    }
    
    @IBAction func changeFilterValue(sender: UISlider) {
        NSUserDefaults.standardUserDefaults().setFloat(slider.value, forKey: "filterValue")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
