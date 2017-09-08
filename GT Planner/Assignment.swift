//
//  Assignment.swift
//  GT Planner
//
//  Created by Lauren Kearley on 8/3/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import Foundation

class Assignment {
    var name: String
    var description: String
    var dueDate: Date
    var isComplete: Bool
    var pointsEarned: Float
    var totalPoints: Float
    var course: Course
    var weight: Float
    
    init?(name: String, description: String, dueDate: Date, course: Course, weight: Float) {
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        self.description = description
        self.dueDate = dueDate
        self.isComplete = false
        self.pointsEarned = 0.0
        self.totalPoints = 0.0
        self.course = course
        self.weight = weight
    }
}
