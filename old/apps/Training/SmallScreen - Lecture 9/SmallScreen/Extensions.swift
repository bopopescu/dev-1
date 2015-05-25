//
//  NSError+Extension.swift
//  SmallScreen
//
//  Created by Eric Appel on 11/17/14.
//  Copyright (c) 2014 Eric Appel. All rights reserved.
//
//
//  NSError+Alert.swift
//  RedditClient
//
//  Created by Eric Appel on 11/10/14.
//  Copyright (c) 2014 Eric Appel. All rights reserved.
//

import UIKit

extension NSError {
    func showAlert() {
        let alert = UIAlertView(title: "Error \(self.domain) : \(self.code)", message: self.localizedDescription, delegate: nil, cancelButtonTitle: "OK")
        alert.show()
    }
}

extension UIColor {
    class func cuappdevGreen() -> UIColor {
        return UIColor(red:0.12, green:0.55, blue:0.45, alpha:1)
    }
}





