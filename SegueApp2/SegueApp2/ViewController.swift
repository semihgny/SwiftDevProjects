//
//  ViewController.swift
//  SegueApp2
//
//  Created by Semih Güney on 10.05.2024.
//

import UIKit

class ViewController: UIViewController {

    var userName = "Name: "
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    
    override func viewDidLoad() { //Ilk ekran yüklendi
        super.viewDidLoad()
       print("viewDidLoad function called")
    }
    override func viewDidDisappear(_ animated: Bool) { //Ekran gitti
        print("viewDidDisappear function called")
    }
    
    override func viewWillDisappear(_ animated: Bool) { //Ekran gidecek
        print("viewWillDisappear function called")
    }
    override func viewWillAppear(_ animated: Bool) { //Ekran gelecek
        print("viewWillAppear function called")
        nameTextField.text = ""
    }
    override func viewDidAppear(_ animated: Bool) { //Ekran geldi
        print("viewDidAppear function called")
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        userName = nameTextField.text!
        performSegue(withIdentifier: "goToSec", sender: nil)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToSec"{
            
        let destinationVC = segue.destination as! SecondViewController
            destinationVC.myName = userName
            
        }
        
    }
    
}

