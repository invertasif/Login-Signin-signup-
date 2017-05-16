//
//  LoginViewController.swift
//  FirebaseDemo
//
//  Created by Asif Ikbal on 5/16/17.
//  Copyright © 2017 Asif Ikbal. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    
    
    @IBAction func loginAction(_ sender: Any) {
        
        guard let userNameText = userNameOutlet.text else {
            showAllert(message: "Enter user name")
            return
        }
        guard let passwordText = passwordOutlet.text else {
            showAllert(message: "Enter password")
            return
        }
        
        FIRAuth.auth()?.signIn(withEmail: userNameText, password: passwordText, completion: { (user, error) in
            if let error = error {
                let errorCode = FIRAuthErrorCode(rawValue: error._code)!
                switch(errorCode) {
                case FIRAuthErrorCode.errorCodeUserNotFound:
                    self.showAllert(message: "Register First")
                case FIRAuthErrorCode.errorCodeWrongPassword:
                    self.showAllert(message: "Invalid enailId/Password")
                default:
                    self.showAllert(message: error.localizedDescription)
                }

            } else {
                print("User is not authenticated")
            }
        })
    }
    @IBAction func signupAction(_ sender: Any) {
        // no use actually for this project
    }
    @IBAction func forgetPasswordAction(_ sender: Any) {
        // user will enter email
        FIRAuth.auth()?.sendPasswordReset(withEmail: "rexasif03@gmail.com", completion: { (error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Successfully reset password")
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAllert(message: String) {
        let allertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        allertController.addAction(okAction)
        present(allertController, animated: true, completion: nil)
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
