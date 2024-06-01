//
//  ViewController.swift
//  GesturRecognizerApp2
//
//  Created by Semih Güney on 12.05.2024.
//

import UIKit

class ViewController: UIViewController {

    var isCar = true
    
    
    @IBOutlet weak var imageCar: UIImageView!
    
    
    @IBOutlet weak var supriseCar: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageCar.isUserInteractionEnabled = true
        let myGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(myFunc))
        imageCar.addGestureRecognizer(myGestureRecognizer)
        
    }

    @objc func myFunc(){
        
        if isCar == true{
            
            imageCar.image = UIImage(named: "mercedes")
            supriseCar.text = "Mercedes"
            isCar = false
            
        }
        else{
            
            imageCar.image = UIImage(named: "car")
            supriseCar.text = "Suprise"
            isCar = true
            
        }
        
    }

}

