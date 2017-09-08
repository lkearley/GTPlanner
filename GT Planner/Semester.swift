//
//  Semester.swift
//  GT Planner
//
//  Created by Lauren Kearley on 8/3/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import Foundation

class Semester {
    var name: String
    var startDate: Date
    var endDate: Date
    var courses: [Course]
    var GPA: Float
    
    init?(name: String, startDate: Date, endDate: Date, courses: [Course]) {
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.courses = [Course]()
        self.GPA = 0.0
    }
    
    func calcGPA() -> Float {
        var qualityPoints: Float = 0.0
        var creditHours: Float = 0.0
        for course in self.courses {
            qualityPoints += course.getQualityPoints()
            creditHours += course.creditHours
        }
        return qualityPoints/creditHours
    }
}
