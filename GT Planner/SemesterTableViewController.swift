//
//  SemesterTableViewController.swift
//  GT Planner
//
//  Created by Lauren Kearley on 9/9/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import UIKit

class SemesterTableViewController: UITableViewController {

    //MARK: Properties
    @IBOutlet weak var gpaTextLabel: UILabel!
    @IBOutlet weak var gpaNumberLabel: UILabel!
    @IBOutlet var semesterTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.semesterTable.reloadData()
        semesterTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Model.sharedModel.currentUser?.semesters.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SemesterCell", for: indexPath) as!SemesterCell
        let semester = Model.sharedModel.currentUser?.semesters[indexPath.item]
        cell.setName(name: (semester?.name)!, controller: self)
        cell.setGPA(gpa: String(format: "%.02f", (semester?.GPA)!), controller: self)
        let date = dateFormat(date: (semester?.startDate)!) + " - " + dateFormat(date: (semester?.endDate)!)
        cell.setDate(date: date, controller: self)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showSemesterPage", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showSemesterPage" else {
            return
        }
        let dest = segue.destination as! SemesterViewController
        let row = sender as! Int
        let semester = Model.sharedModel.currentUser!.semesters[row]
        dest.semester = semester
    }
    
    //MARK: Funcitons
    func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter.string(from: date)
    }
    

}

class SemesterCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var datesTextLabel: UILabel!
    @IBOutlet weak var gpaTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: Functions
    func setName(name: String, controller: SemesterTableViewController) {
        nameTextLabel.text = name
    }
    
    func setDate(date: String, controller: SemesterTableViewController) {
        datesTextLabel.text = date
    }
    
    func setGPA(gpa: String, controller: SemesterTableViewController) {
        gpaTextLabel.text = gpa
    }
    
}
