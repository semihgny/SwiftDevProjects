//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Semih Güney on 9.05.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var birthday: UITextField!
   
    
    @IBOutlet weak var nameText: UILabel!
    
    @IBOutlet weak var birthdayText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let savedName = UserDefaults.standard.object(forKey: "nameD")
        let savedBirthday = UserDefaults.standard.object(forKey: "birthdayD")

        if let newName = savedName as? String {
            
            nameText.text = newName
            
        }
        
        if let newBirthday = savedBirthday as? String {
            
            birthdayText.text = newBirthday
            
        }
        
    }

    @IBAction func save(_ sender: Any) {
        
        nameText.text = "Name: \(name.text!)"
        birthdayText.text = "Birthday: \(birthday.text!)"
        
        UserDefaults.standard.set(nameText.text, forKey: "nameD")
        UserDefaults.standard.set(birthdayText.text, forKey: "birthdayD")
        
    }
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let savedName = UserDefaults.standard.object(forKey: "nameD")
        let savedBirthday = UserDefaults.standard.object(forKey: "birthdayD")
        
        if let newName = savedName as? String {
            
            UserDefaults.standard.removeObject(forKey: "nameD")
            nameText.text = "Name: "
        
        }
        
        if (savedBirthday as? String) != nil {
            
            UserDefaults.standard.removeObject(forKey: "birthdayD")
            birthdayText.text = "Birthday: "
            
        }
        
    }
    
    
}

