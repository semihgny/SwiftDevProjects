//
//  ViewController.swift
//  TimerProject
//
//  Created by Semih Güney on 12.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()

    var count = 0
    
    @IBOutlet weak var timerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        count = 10
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(myFunc), userInfo: nil, repeats: true)
        
    }

    
    @objc func myFunc(){
        
        timerLabel.text = "Timer: \(count)"
        count -= 1
        if count == 0{
            
            timer.invalidate()
            timerLabel.text = "Finish"
            
        }
        
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
    
        
        print("Button clicked")
        
    }
    
}

