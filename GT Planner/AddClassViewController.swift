//
//  AddClassViewController.swift
//  GT Planner
//
//  Created by Lauren Kearley on 9/9/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import UIKit

class AddClassViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var weight = [Float]()
    var names = [String]()
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var gradeSegment: UISegmentedControl!
    @IBOutlet weak var courseTableView: UITableView!
    @IBOutlet weak var passFailSwitch: UISwitch!
    
    override func viewDidLoad() {
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
        return self.weight.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GradeWeight", for: indexPath) as!GradeAddCourseTableCell
        cell.setName(name: names[indexPath.item])
        cell.setWeight(weight: String(format: "%.02", weight[indexPath.item]))
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    //MARK: Actions
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
    }
}

class GradeAddCourseTableCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var weightTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setName(name: String) {
        nameTextLabel.text = name
    }
    
    func setWeight(weight: String) {
        weightTextLabel.text = weight
    }
    

}
