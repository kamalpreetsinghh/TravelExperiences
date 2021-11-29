//
//  User.swift
//  TravelExperiences
//
//  Created by Rahul Vashist on 29/11/21.
//

import Foundation

class User {
    var name: String
    var email: String
    var password: String
    
    init(_ name: String, _ email: String, _ password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    func getPassword() -> String {
        return self.password
    }
}
