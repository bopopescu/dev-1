//
//  sjs382_asteroidViewController.swift
//  sjs382_P6
//
//  Created by Samuel Svenningsen on 11/2/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class sjs382_asteroidViewController: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var animator: UIDynamicAnimator!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        imageView.center = view.center
        animator = UIDynamicAnimator(referenceView: view)
        let collisionBehavior = UICollisionBehavior(items: [imageView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionDelegate = self
        animator.addBehavior(collisionBehavior)
        // Do any additional setup after loading the view.
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying) {
        
        imageView.image = UIImage(named: "ship")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func panShip(sender: UIPanGestureRecognizer) {
        let view = sender.view!
        let point = sender.translationInView(view)
        view.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        sender.setTranslation(CGPointZero, inView: view)
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
