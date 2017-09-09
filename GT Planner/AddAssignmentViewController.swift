//
//  AddAssignmentViewController.swift
//  GT Planner
//
//  Created by Lauren Kearley on 9/8/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import UIKit

class AddAssignmentViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTestField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var coursePicker: UIPickerView!
    @IBOutlet weak var weightPicker: UIPickerView!

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
//        if (nameTextField.text?.isEmpty) {
//            <#code#>
//        }
//        Model.sharedModel.currentUser.assignments.append(Assignment(name: nameTextField.text, description: descriptionTestField.text, dueDate: dueDatePicker.date, course: <#T##Course#>, weight: <#T##Float#>))
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
