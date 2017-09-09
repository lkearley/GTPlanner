
//
//  File.swift
//  GT Planner
//
//  Created by Lauren Kearley on 9/8/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import Foundation

class Model {
    static let sharedModel: Model = Model()
    static let sharedDatabaseManager: DatabaseManager = DatabaseManager()
    
    var currentUserID: String = ""
    var currentUser: User? = nil

    init() {
    }
}
