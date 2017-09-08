//
//  File.swift
//  GT Planner
//
//  Created by Lauren Kearley on 9/8/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import Foundation

class Model {
    var currentUserID: String
    
    init?(currentUserID: String) {
        guard !currentUserID.isEmpty else {
            return nil
        }
        self.currentUserID = currentUserID
    }
}
