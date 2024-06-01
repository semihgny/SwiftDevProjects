//
//  ViewController.swift
//  FirstApp
//
//  Created by Semih Güney on 5.05.2024.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func changeClicked(_ sender: Any) {
        
        
        imageView.image = UIImage(named: "mercedes")
   
    }
    
  
    

}

