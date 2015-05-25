//
//  sjs382Person.swift
//  sjs382_P5
//
//  Created by Samuel Svenningsen on 10/24/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class Person: Printable {
    let fname: String
    let lname: String
    let phone: String
    let email: [String]
    let picture: UIImage
    
    var description: String {
        return "\nName: \(fname) \(lname)\nPhone: \(phone)\nEmail: \(email)"
    }
    
    var fullName: String {
        return "\(fname) \(lname)"
    }
    
    init(fname: String, lname: String, phone: String, email: [String], picture: UIImage) {
        self.fname = fname
        self.lname = lname
        self.phone = phone
        self.email = email
        self.picture = picture
    }
}