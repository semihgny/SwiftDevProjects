//
//  ViewController.swift
//  instagramCloneApp
//
//  Created by Semih Güney on 14.01.2026.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        if mailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: mailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.alert(messageInput: error?.localizedDescription ?? "Error", TitleInput: "Error")

                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else {
            self.alert(messageInput: "eMail / Password ?", TitleInput: "Error")

        }

    }
    
    func alert(messageInput: String, TitleInput: String) {
        let alert = UIAlertController(title: TitleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if mailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: mailText.text!, password: passwordText.text!) { authdata, error in
               
                if error != nil {
                    self.alert(messageInput: error?.localizedDescription ?? "Error", TitleInput: "Error")
                }
                else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
            }
            
        } else {
            self.alert(messageInput: "E Mail / Password ?", TitleInput: "Error")

        }
    }
}

