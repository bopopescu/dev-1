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
    var collision: UICollisionBehavior?
    var gravity: UIGravityBehavior?
    var timer: NSTimer!
    var score: Int!
    var remove:AnyObject?
    var playing: Bool!
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.center = view.center
        animator = UIDynamicAnimator(referenceView: view)
        self.collision = UICollisionBehavior(items: [imageView])
        self.collision!.translatesReferenceBoundsIntoBoundary = true
        self.collision!.collisionDelegate = self
        animator.addBehavior(self.collision)
        self.gravity = UIGravityBehavior(items: [])
        animator.addBehavior(self.gravity)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.20, target: self, selector: "fireTimer:", userInfo: nil, repeats: true)
        score = 0
        playing = true
        // Do any additional setup after loading the view.
    }
    
    func fireTimer(sender: NSTimer) {
        if playing! {
            let asteriod = UIView(frame:CGRectMake(0,0,10,10))
        
            asteriod.center = CGPoint(x: CGFloat(drand48()) * 500, y: 30.0)
        
            asteriod.backgroundColor = UIColor.blackColor()
        
            view.addSubview(asteriod)
            self.gravity?.addItem(asteriod)
            self.collision?.addItem(asteriod)
        }

        
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying, atPoint p: CGPoint) {
        
        if (item !== imageView){
            self.gravity?.removeItem(item)
            self.collision?.removeItem(item)
            (item as UIView).removeFromSuperview()
            score! += 1
            scoreLabel.text = "Score: " + String(score)
        }
        
        
        
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint) {
        imageView.removeFromSuperview()
        animator.removeAllBehaviors()
        gameOverLabel.text = "Game Over"
        playing = false
        
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
        animator.updateItemUsingCurrentState(view)
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
