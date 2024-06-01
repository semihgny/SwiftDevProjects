//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Semih Güney on 12.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var isCar = true
    
    @IBOutlet weak var carImage: UIImageView!
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carImage.isUserInteractionEnabled = true
        let GestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(myFunc))
        carImage.addGestureRecognizer(GestureRecognizer)
    }

        @objc func myFunc(){
            
            if isCar == true {
                
                carImage.image = UIImage(named: "mercedes")
                myLabel.text = "Mercedes"
                isCar = false
            }
            else{
                
                carImage.image = UIImage(named: "car")
                myLabel.text = "Suprise"
                isCar = true
            }
            
        }

    

}

