//
//  ViewController.swift
//  SegueApp
//
//  Created by Semih Güney on 10.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UITextField!
    var userName = ""
    
    
    
    @IBOutlet weak var firstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func nextClicked(_ sender: Any) {
        userName = firstLabel.text!
        performSegue(withIdentifier: "goToSec", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSec"
        {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myName = nameLabel.text!
        }
    }
    
    
}

