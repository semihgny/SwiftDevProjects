//
//  ViewController.swift
//  AlertProject
//
//  Created by Semih Güney on 11.05.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var usernameText: UITextField!
        
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var password2Text: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func signUpClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Error!", message: "username not found", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { UIAlertAction in
            print("Button Clicked")
        }
        self.present(alert, animated: true, completion: nil)
        alert.addAction(okButton)
    }
    

}

