//
//  AddSemesterViewController.swift
//  GT Planner
//
//  Created by Lauren Kearley on 9/9/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import UIKit

class AddSemesterViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if (nameTextField.text?.isEmpty)! {
            errorAlert(title: "Error", message: "Please enter semester name")
            return
        }
        Model.sharedModel.currentUser?.semesters.append(Semester(name: nameTextField.text!, startDate: startDatePicker.date, endDate: endDatePicker.date, courses: [Course]())!)
        self.popNav()
    }

    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.popNav()
    }
    
    //MARK: Functions
    
    func errorAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func popNav() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
