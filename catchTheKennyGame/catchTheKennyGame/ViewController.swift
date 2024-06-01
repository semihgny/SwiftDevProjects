//
//  ViewController.swift
//  catchTheKennyGame
//
//  Created by Semih Güney on 15.05.2024.
//

import UIKit

class ViewController: UIViewController {

    //variables
    var score = 0
    var counter = 0
    var highScore = 0
    var timer = Timer()
    var hideTimer = Timer()
    var kennys = [UIImageView]()
    
    
    //labels
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    //views
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //highScore
        
        let savedHighScore = UserDefaults.standard.object(forKey: "highScore")
        
        if savedHighScore == nil {
            
            highScore = 0
            highscoreLabel.text = "Highscore: \(highScore)"
            
            
        }
        
    
        if let newScore = savedHighScore as? Int {
            
            highScore = newScore
            highscoreLabel.text = "Highscore: \(highScore)"
            
        }
        
        
        //variables
        counter = 10
        
        //text
        scoreLabel.text = "Score \(score)"
        
        //images
        kennys = [kenny1 , kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)

        for kenny in kennys {
            
            kenny.isHidden = true
            
        }
        
        //timers
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counterDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
    }

    @objc func increaseScore(){
        
        score += 1
        scoreLabel.text = "Score: \(score)"
        
    }
    
    @objc func counterDown(){
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            //highScore
            if self.score > self.highScore {
                
                self.highScore = self.score
                highscoreLabel.text = "Highscore: \(highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScore")
                
            }
            //other
            timer.invalidate()
            hideTimer.invalidate()
            
            for kenny in kennys {
                
                kenny.isHidden = true
                
            }
            
            let alert = UIAlertController(title: "Time's up!", message: "do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                //replay
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.counterDown), userInfo: nil, repeats: true)
                
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            
            self.present(alert, animated: true, completion: nil)
        }
    
        
            
            
        }
        
        
   

   @objc func hideKenny(){
   
       for kenny in kennys {
           
           kenny.isHidden = true
           
       }
       
       var random = Int(arc4random_uniform(UInt32(kennys.count - 1)))
       
       
       kennys[random].isHidden = false
       
   }
    
    
}
