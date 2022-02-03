//
//  SigningInUser.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 14/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import UIKit

class SigningInUser: UIViewController {

    @IBOutlet weak var firstNameTextField: CustomStyleTextField!
    @IBOutlet weak var lastNameTextField: CustomStyleTextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameTextField.text = "Mona"
        lastNameTextField.text = "AlShaikh"
        
    }
    
    @IBAction func signInButton(_ sender: Any) {
        UserInfoAPI.signInUser(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!) { (signInUser, errorMessage) in
            if let message = errorMessage  {
                    let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                }else {
                if let loggedInUser = signInUser{
                    let vc = self.storyboard?.instantiateViewController(identifier: "MainTabBar")
                    ManagingLogs.loggedUser = loggedInUser
                    self.present(vc!, animated: true, completion: nil)
                    
                }
            }
        }
    }
}
    



