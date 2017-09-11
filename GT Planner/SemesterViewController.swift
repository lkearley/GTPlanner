//
//  SemesterViewController.swift
//  GT Planner
//
//  Created by Lauren Kearley on 9/9/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import UIKit

class SemesterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var semester: Semester?
    
    //MARK: Properties
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var gpaTextLabel: UILabel!
    @IBOutlet weak var courseTableView: UITableView!

    override func viewDidLoad() {
        nameTextLabel.text = semester?.name
        gpaTextLabel.text = String(format: "%.02f", (semester?.GPA)!)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (semester!.courses.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SemesterCourseCell", for: indexPath) as!SemesterCoursesTableCell
        let course = semester?.courses[indexPath.item]
        cell.setName(name: (course?.courseName)!)
        cell.setGPA(gpa: (String(format: "%.02f", (course?.grade)!) + "%"))
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
    }



}

class SemesterCoursesTableCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var gpaTextLabel: UILabel!
    @IBOutlet weak var nameTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setName(name: String) {
        nameTextLabel.text = name
    }
    
    func setGPA(gpa: String) {
        gpaTextLabel.text = gpa
    }
}
