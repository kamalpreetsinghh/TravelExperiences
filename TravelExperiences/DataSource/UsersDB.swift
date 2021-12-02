//
//  User.swift
//  TravelExperiences
//
//  Created by Rahul Vashist on 29/11/21.
//

import Foundation
class UsersDB {
    // singleton setup
    
    static let shared = UsersDB()
    
    private init() {
        
    }
    
    // resource the singleton should manage
    var usersList: [User] = []
    
    func getUsersList() -> [User] {
        return self.usersList
    }
}

