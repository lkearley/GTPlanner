//
//  LoginViewController.swift
//  GT Planner
//
//  Created by Lauren Kearley on 8/3/17.
//  Copyright © 2017 Lauren Kearley. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FacebookLogin
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func loginButton(_ sender: UIButton) {
        guard !(emailTextField?.text?.isEmpty)! && !(passwordTextField.text?.isEmpty)! else {
            self.errorAlert(title: "Error", message: "Please enter your email and password")
            return
        }
        Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
            if let error = error {
                self.errorAlert(title: "Login Failed", message: error.localizedDescription)
                return
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Tab")
            self.present(vc!, animated: true, completion: nil)
        }
        
    }

    //MARK: Functions
    @IBAction func loginFacebook(_ sender: UIButton) {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                self.errorAlert(title: "Facebook Login Failed", message: error.localizedDescription)
                return
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    self.errorAlert(title: "Facebook Login Failed", message: error.localizedDescription)
                    return
                }
            
                
                if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Tab") {
                    UIApplication.shared.keyWindow?.rootViewController = viewController
                    self.dismiss(animated: true, completion: nil)
                }
                
            })
            
        }
    }
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        var email = ""
        let alertController = UIAlertController(title: "Recover Password", message: "Please enter account email", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Send Password", style: .default, handler: {
            alert -> Void in
            let emailTextField = alertController.textFields![0] as UITextField
            email = emailTextField.text!
            if email != "" {
                Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                    if let error = error {
                        self.errorAlert(title: "Error", message: error.localizedDescription)
                        return
                    }
                    
                }
                
                
            }
            
        })
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter email"
        }
        alertController.addAction(saveAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: Functions
    func errorAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
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
