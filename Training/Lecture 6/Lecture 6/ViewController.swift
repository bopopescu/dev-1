//
//  ViewController.swift
//  Lecture 6
//
//  Created by Samuel Svenningsen on 10/27/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    @IBOutlet weak var attachmentView: UIImageView!
    var timer: NSTimer!
    @IBOutlet weak var imageView: UIImageView!
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        imageView.center = view.center
        attachmentView.center = CGPoint(x: view.center.x - 100.0, y: attachmentView.center.y)
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0/15.0, target: self, selector: "fireTimer:", userInfo: nil, repeats: true)
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(UIGravityBehavior(items: [imageView]))
        
        let collisionBehavior = UICollisionBehavior(items: [imageView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionDelegate = self
        animator.addBehavior(collisionBehavior)
        
        let itemBehavior = UIDynamicItemBehavior(items: [imageView])
        itemBehavior.elasticity = 1.0
        animator.addBehavior(itemBehavior)
        
        attachmentBehavior = UIAttachmentBehavior(item: imageView, attachedToAnchor: attachmentView.center)
        animator.addBehavior(attachmentBehavior)
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying, atPoint p: CGPoint) {
        imageView.image = UIImage(named:"SadDoge")
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, endedContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying) {
        imageView.image = UIImage(named: "Doge")
    }
    
    func fireTimer(sender: NSTimer) {
        view.backgroundColor = UIColor.randomColor()
    }
    
    @IBAction func moveAnchor(sender: UIPanGestureRecognizer) {
        attachmentBehavior.anchorPoint = sender.locationInView(view)
        attachmentView.center = attachmentBehavior.anchorPoint
    }
    
    @IBAction func panDoge(sender: UIPanGestureRecognizer) {
        let view = sender.view!
        let point = sender.translationInView(view)
        view.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        sender.setTranslation(CGPointZero, inView: view)
    }
    
    @IBAction func rotateDoge(sender: UIRotationGestureRecognizer) {
        let view = sender.view!
        view.transform = CGAffineTransformRotate(view.transform, sender.rotation)
        sender.rotation = 0.0
        
    }
    
    @IBAction func tapDoge(sender: UITapGestureRecognizer) {
        imageView.image = UIImage(named: "SadDoge")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIColor {
    class func randomColor() -> UIColor {
        let r = CGFloat(drand48())
        let g = CGFloat(drand48())
        let b = CGFloat(drand48())
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}