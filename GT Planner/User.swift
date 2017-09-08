//
//  User.swift
//  GT Planner
//
//  Created by Lauren Kearley on 9/8/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import Foundation

class User {
    var name: String
    var semesters: [Semester]
    var currentSemester: Semester
    var courses: [Course]
    var assignments: [Assignment]
    
    init?(name: String, semesters: [Semester], currentSemester: Semester, courses: [Course], assignments: [Assignment]) {
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        self.semesters = semesters
        self.currentSemester = currentSemester
        self.courses = courses
        self.assignments = assignments
    }
    

}
