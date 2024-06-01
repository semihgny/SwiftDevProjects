//
//  SecondViewController.swift
//  SegueApp2
//
//  Created by Semih Güney on 10.05.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    var myName = ""
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Name: \(myName)"
        
        
        
        
    }
    

    
    
    
    
}
