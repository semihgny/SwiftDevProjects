//
//  ViewController.swift
//  TimerProject2
//
//  Created by Semih Güney on 12.05.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    var counter = 0
    
    var timerD = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 10
        timerLabel.text = "Timer: \(counter)"
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(myFunc), userInfo: nil, repeats: true)

       // Thread.sleep(forTimeInterval: 10)
        
    }

    @objc func myFunc(){
        
        timerLabel.text = "Timer: \(counter)"
        counter -= 1
        
        if counter == 0 {
            
            timerD.invalidate()
            timerLabel.text = "Finish.."

        }
    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        print("Button Clicked")
    }
    
}

