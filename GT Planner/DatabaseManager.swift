//
//  DatabaseManager.swift
//  GT Planner
//
//  Created by Lauren Kearley on 9/8/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import Foundation
import Firebase

class DatabaseManager {
    static let sharedDatabseManager = DatabaseManager()
    
    var ref: DatabaseReference = Database.database().reference()
    
    func readAssignments(ui: String) -> Bool {
//        let userRef: DatabaseReference = Database.database().reference().
        return true
    }
}
