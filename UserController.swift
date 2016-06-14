//
//  UserController.swift
//  Xplore
//
//  Created by Abdulghafar Al Tair on 6/14/16.
//  Copyright © 2016 Abdulghafar Al Tair. All rights reserved.
//

import Foundation

struct User {
    var email: String
    var password: String
}

class UserController {
    
    class var sharedInstance: UserController {
        struct Static {
            static var instance:UserController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token)    {
            Static.instance = UserController()
        }
        return Static.instance!
}


    func loginUser(email: String, password: String) {
        let user = ["email":email,"password":password]
}

    func registerUser(email: String, password: String) {
        let user = ["email":email,"password":password]
}
}


