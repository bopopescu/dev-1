//
//  ViewController.swift
//  Lecture 7
//
//  Created by Samuel Svenningsen on 11/3/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit
import AssetsLibrary

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageButton: UIButton!
    
    var context: CIContext!
    var filter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        context = CIContext(options: nil)
        
    }

    @IBAction func openImage(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageButton.setImage(image, forState: .Normal)
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveImage(sender: UIBarButtonItem) {
        let image   = filter.outputImage
        let cgImage = context.createCGImage(image, fromRect: image!.extent())
        let library = ALAssetsLibrary()
        library.writeImageToSavedPhotosAlbum(cgImage, metadata: image?.properties(), completionBlock: nil)
    }
    
    @IBAction func applyFilter(sender: UIBarButtonItem) {
        let image = imageButton.imageForState(.Normal)
        let img = CIImage(image: image)
        
        let filterChoice = NSUserDefaults().integerForKey("filterChoice")
        let inputRadius  = NSUserDefaults().floatForKey("filterValue")
        
        switch filterChoice{
        case 0:
            filter = CIFilter(name: "CIGaussianBlur")
        default:
            filter = CIFilter(name: "CIBloom")
        }
        
        filter.setValue(img,forKey: "inputImage")
        filter.setValue(inputRadius, forKey: "inputRadius")
        
        let finalImage = context.createCGImage(filter.outputImage, fromRect: filter.outputImage.extent())
        
        imageButton.setImage(UIImage(CGImage: finalImage), forState: .Normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

