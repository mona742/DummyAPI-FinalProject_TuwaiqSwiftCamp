//
//  CreateUserVC.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 13/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import UIKit

class CreateUserVC: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func createUserButton(_ sender: Any) {
        UserInfoAPI.posttingNewUser(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!) { newUserAccount,errorMessage  in
            if errorMessage != nil {
                let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }else {
                let alert = UIAlertController(title: "Success", message: "User Created", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    @IBAction func goToSignInButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
