//
//  Person.swift
//  lecture 5
//
//  Created by Samuel Svenningsen on 10/20/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

import UIKit

class Person {
    let fname: String
    let lname: String
    let phone: String
    let email: [String]
//    let picture: UIImage
    
    var description: String {
        return "\nName: \(fname) \(lname)
    }
    
    
    init(fname: String, lname: String, phone: String, email: [String], picture: String) {
        self.fname = fname
        self.lname = lname
        self.phone = phone
        self.email = email
//        self.picture = picture
        
        
    }
}