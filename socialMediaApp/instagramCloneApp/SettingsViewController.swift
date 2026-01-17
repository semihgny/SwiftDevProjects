//
//  SettingsViewController.swift
//  instagramCloneApp
//
//  Created by Semih Güney on 14.01.2026.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutClicked(_ sender: Any) {
        do{
         try
            Auth.auth().signOut()
            
        } catch {
        print("error signing out")
        }
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
