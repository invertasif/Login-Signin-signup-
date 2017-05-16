//
//  SignUpViewController.swift
//  FirebaseDemo
//
//  Created by Asif Ikbal on 5/16/17.
//  Copyright © 2017 Asif Ikbal. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    
    
    @IBOutlet weak var emailIdOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBAction func signUpAction(_ sender: Any) {
        
        
        // authentication 

        guard let emailText = emailIdOutlet.text else {
            showAllert(message: "Please enter email id")
            return
        }
        guard let passwordText = passwordOutlet.text else {
            showAllert(message: "Password can not be emtpy")
            return
        }
        
        FIRAuth.auth()?.createUser(withEmail: emailText, password: passwordText, completion: { (user, error) in
            if let  error = error {
                let errorCode = FIRAuthErrorCode(rawValue: error._code)!
                switch(errorCode) {
                case FIRAuthErrorCode.errorCodeEmailAlreadyInUse:
                    self.showAllert(message: "Email id is already in use")
                    
                case FIRAuthErrorCode.errorCodeWeakPassword:
                    self.showAllert(message: "Weak Password")
                    
                default : self.showAllert(message: error.localizedDescription)
                    
                }
            } else {
                self.dismiss(animated: true, completion: nil)
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
