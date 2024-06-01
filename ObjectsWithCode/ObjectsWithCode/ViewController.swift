//
//  ViewController.swift
//  ObjectsWithCode
//
//  Created by Semih Güney on 9.05.2024.
//

import UIKit

class ViewController: UIViewController {

    var myButton = UIButton()
    var myLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        myLabel.text = "Test Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width / 2 - width * 0.80 / 2, y: height / 2 - 50/2, width: width * 0.8, height: 50)
        view.addSubview(myLabel)
        
        myButton.setTitle("My Button", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.frame = CGRect(x: width/2-100, y: height * 0.6, width: 200, height: 100)
        myButton.addTarget(self, action: #selector(ViewController.myFunc), for: UIControl.Event.touchUpInside)
        view.addSubview(myButton)
    }

   @objc func myFunc(){
        
       myLabel.text = "Tapped"
       
    }
 
}







