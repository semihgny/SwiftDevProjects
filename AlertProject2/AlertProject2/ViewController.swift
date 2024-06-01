//
//  ViewController.swift
//  AlertProject2
//
//  Created by Semih Güney on 12.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var password2Text: UITextField!
    
    func alert(message : String, title : Bool){
        
        var titleText = ""
        
        if title == true {
            
            titleText = "Error!!"
            
        }
        else{
            titleText = "Congratulations!!"
        }
        
        var alert = UIAlertController(title: titleText, message: message, preferredStyle: UIAlertController.Style.alert)
        var okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        self.present(alert, animated: true, completion: nil)
        alert.addAction(okButton)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if usernameText.text == "" {
            
            alert(message: "Username not found", title: true)
            
        }
        
        else if passwordText.text == "" {
            
            alert(message: "First password not found!!", title: true)
        }
        
        else if password2Text.text == "" {
            
            alert(message: "Second password not found!!", title: true)
            
        }
        
        else if passwordText.text != password2Text.text {
            
            alert(message: "Passwords do not match!!", title: true)
        }
        else{
            
            alert(message: "You have successfully registered!!", title: false)
        }
        
    }
    
    
    /*  let alertUsername = UIAlertController(title: "Error", message: "Username not found!!", preferredStyle: UIAlertController.Style.alert)
     let alertPass = UIAlertController(title: "Error", message: "First password not found!!", preferredStyle: UIAlertController.Style.alert)
     let alertPass2 = UIAlertController(title: "Error", message: "Second password not found!!", preferredStyle: UIAlertController.Style.alert)
     let alertPassNot = UIAlertController(title: "Error", message: "Passwords do not match!!", preferredStyle: UIAlertController.Style.alert)
     let alertCong = UIAlertController(title: "Congratulations!!", message: "You have successfully registered.", preferredStyle: UIAlertController.Style.alert)
     
     let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
     
     alertUsername.addAction(okButton)
     alertPass.addAction(okButton)
     alertPass2.addAction(okButton)
     alertPassNot.addAction(okButton)
     alertCong.addAction(okButton)
     
     if usernameText.text == "" {
     
     self.present(alertUsername, animated: true, completion: nil)
     
     }
     
     else if passwordText.text == "" {
     
     self.present(alertPass, animated: true, completion: nil)
     
     }
     
     else if password2Text.text == "" {
     
     self.present(alertPass2, animated: true, completion: nil)
     }
     
     else if passwordText.text != password2Text.text {
     
     self.present(alertPassNot, animated: true, completion: nil)
     
     }
     else{
     
     self.present(alertCong, animated: true, completion: nil)
     
     }
     }
     */
}
