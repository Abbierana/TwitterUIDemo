//
//  LoginViewController.swift
//  TwitterDemo
//
//  Created by Abhishek Rana on 31/10/23.
//

import UIKit

class LoginViewController: BaseVC {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        validations()
    }
    
    func validations() {
        let email = emailTextField.text ?? ""
        if emailTextField.text == "" {
            showToast(message: "Please enter your email")
        } else if passwordTextField.text == "" {
            showToast(message: "Please enter your password")
        }else if email.isValidEmail(){
            goNextController()
        }else{
            showToast(message: "Please enter a valid email")
        }
    }
}
