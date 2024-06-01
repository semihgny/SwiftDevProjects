//
//  ViewController.swift
//  CatchKenny
//
//  Created by Semih Güney on 12.05.2024.
//


import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var im1: UIImageView!
    
    @IBOutlet weak var im2: UIImageView!
    
    @IBOutlet weak var im3: UIImageView!
    
    @IBOutlet weak var im4: UIImageView!
    
    @IBOutlet weak var im5: UIImageView!
    
    @IBOutlet weak var im6: UIImageView!
    
    @IBOutlet weak var im7: UIImageView!
    
    @IBOutlet weak var im8: UIImageView!
    
    @IBOutlet weak var im9: UIImageView!
    
    
    var timeCounter = Timer() //User interface
    
    var score = 0 //User interface
    
    var count = 0 //Time counter
    
    var timer = Timer() //Kenny
    
    var sayac = 0 //Kenny tap counter
    
    var imageD : [Int : UIImage?] = [:]
    
    let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again", preferredStyle: UIAlertController.Style.alert)
    
    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
    

    @IBOutlet weak var hScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var gestureImage1 = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        var gestureImage2 = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        var gestureImage3 = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        var gestureImage4 = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        var gestureImage5 = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        var gestureImage6 = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        var gestureImage7 = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        var gestureImage8 = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        var gestureImage9 = UITapGestureRecognizer(target: self, action: #selector(tappedImage))

        im1.addGestureRecognizer(gestureImage1)
        im2.addGestureRecognizer(gestureImage2)
        im3.addGestureRecognizer(gestureImage3)
        im4.addGestureRecognizer(gestureImage4)
        im5.addGestureRecognizer(gestureImage5)
        im6.addGestureRecognizer(gestureImage6)
        im7.addGestureRecognizer(gestureImage7)
        im8.addGestureRecognizer(gestureImage8)
        im9.addGestureRecognizer(gestureImage9)

        imageD = [1 : im1.image , 2: im2.image  ,3 : im3.image, 4 : im4.image, 5 : im5.image , 6 : im6.image, 7 : im7.image , 8 : im8.image, 9 : im9.image ]
    
        count = 10
        
        var replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
            
            self.startGame()
            

            }
     
        let savedScore: Void = UserDefaults.standard.set(hScoreLabel.text, forKey: "Score")
        
        if let newScore = savedScore as? String {
            
            hScoreLabel.text = newScore
            
        }
        
        alert.addAction(okButton)
        alert.addAction(replayButton)
        self.startGame()

    }
    
    @objc func tappedImage(){
        
        score += 1
        scoreLabel.text = "Score: \(score)"
        print("Tapped Image")
        
    }
    
    func startGame(){
        
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(kennyFunc), userInfo: nil, repeats: true)
    
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeUser), userInfo: nil, repeats: true)
        
    }
    
    @objc func timeUser(){
        
        timeLabel.text = String(count)
        count -= 1
        if count == 0 {
           timeCounter.invalidate()
           timer.invalidate()
            self.present(alert, animated: true, completion: nil)
            hScoreLabel.text = String(score)
                    
            if let newScore = hScoreLabel.text! as? Int {
                        
                hScoreLabel.text = scoreLabel.text
                UserDefaults.standard.set(hScoreLabel.text, forKey: "score")
                        
                        
                    }
                    
                    
                    
                    
                }
                
                

            }
            
        
        
    
    
    @objc func kennyFunc() {
        
        
        var random = Int.random(in: 1...9)
        
        //scoreLabel.text = String(random)
        
        openFunc(x : random)
        
        
        
    }
    
    
    
    func openFunc(x : Int){
        
        let num = 0
        var selectOpen = x
        switch selectOpen {
        case 1:
            closeImage()
            tapClose()
            im1.isUserInteractionEnabled = true
            im1.image = UIImage(named: "kenny")
        case 2:
            closeImage()
            tapClose()
            im2.isUserInteractionEnabled = true
            im2.image = UIImage(named: "kenny")
        case 3:
            closeImage()
            tapClose()
            im3.isUserInteractionEnabled = true
            im3.image = UIImage(named: "kenny")
        case 4:
            closeImage()
            tapClose()
            im4.isUserInteractionEnabled = true
            im4.image = UIImage(named: "kenny")
        case 5:
            closeImage()
            tapClose()
            im5.isUserInteractionEnabled = true
            im5.image = UIImage(named: "kenny")
        case 6:
            closeImage()
            tapClose()
            im6.isUserInteractionEnabled = true
            im6.image = UIImage(named: "kenny")
        case 7:
            closeImage()
            tapClose()
            im7.isUserInteractionEnabled = true
            im7.image = UIImage(named: "kenny")
        case 8:
            closeImage()
            tapClose()
            im8.isUserInteractionEnabled = true
            im8.image = UIImage(named: "kenny")
        case 9:
            closeImage()
            tapClose()
            im9.isUserInteractionEnabled = true
            im9.image = UIImage(named: "kenny")
        default :
            print("error")
            
        }
        
        
    }
    
    func closeImage(){
        im1.image = nil
        im2.image = nil
        im3.image = nil
        im4.image = nil
        im5.image = nil
        im6.image = nil
        im7.image = nil
        im8.image = nil
        im9.image = nil
        
    }
    
    func tapClose(){
        
        
        im1.isUserInteractionEnabled = false
        im2.isUserInteractionEnabled = false
        im3.isUserInteractionEnabled = false
        im4.isUserInteractionEnabled = false
        im5.isUserInteractionEnabled = false
        im6.isUserInteractionEnabled = false
        im7.isUserInteractionEnabled = false
        im8.isUserInteractionEnabled = false
        im9.isUserInteractionEnabled = false


    }
    
}

