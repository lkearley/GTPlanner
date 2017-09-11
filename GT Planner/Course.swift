//
//  Course.swift
//  GT Planner
//
//  Created by Lauren Kearley on 8/3/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import Foundation

class Course {
    var courseName: String
    var gradeWeightsFlag: Bool
    var grade: Float
    var creditHours: Float
    var semester: Semester
    var assignments: [Assignment]
    var weights: [Float]
    var weightNames: [String]
    
    init?(courseName: String, gradeWeightsFlag: Bool, creditHours: Float, semester: Semester, weights: [Float], weightNames: [String]) {
        guard courseName.isEmpty else {
            return nil
        }
        self.courseName = courseName
        self.gradeWeightsFlag = gradeWeightsFlag
        self.grade = 0.0
        self.creditHours = creditHours
        self.semester = semester
        self.assignments = [Assignment]()
        self.weights = weights
        self.weightNames = weightNames
    }
    
    func getQualityPoints() -> Float {
        if grade >= 90.00 {
            return 4
        }
        else if grade >= 80.00 {
            return 3
        }
        else if grade >= 70.00 {
            return 2
        }
        else if grade >= 60.00 {
            return 1
        }
        else {
            return 0
        }
    }
    
//    func getWeightedGrade() -> Float {
//        
//        for assignment in assignments {
//            let grade = assignment.pointsEarned/assignment.totalPoints
//            
//        }
//    }
}
