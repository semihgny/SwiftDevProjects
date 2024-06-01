//
//  ViewController.swift
//  Calculator
//
//  Created by Semih Güney on 8.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var Result: UILabel!
    
    @IBOutlet weak var firstNumber: UITextField!
    
    
    @IBOutlet weak var secondNumber: UITextField!
    
    
    @IBAction func Topla(_ sender: Any) {
        
        if let num1 = Int(firstNumber.text!){
            if let num2 = Int(secondNumber.text!){
                Result.text = String(num1+num2)
            }
            else{
                print("Wrong Input")
            }
        }
        else{
            print("Wrong Input")

        }
        
        
        
    }
    
    
    @IBAction func Cikar(_ sender: Any) {
        
        var num1 = Int(firstNumber.text!) ?? 0
        var num2 = Int(secondNumber.text!) ?? 0
        Result.text = String(num1-num2)
    
    }
    
    @IBAction func Carp(_ sender: Any) {
        if let num1 = Int(firstNumber.text!){
            if let num2 = Int(secondNumber.text!){
                Result.text = String(num1*num2)
            }
            else{
                print("Wrong Input")

            }
            
        } else{
            print("Wrong Input")

        }
    }
    
    @IBAction func Bol(_ sender: Any) {
        var num1 = Int(firstNumber.text!) ?? 0
        var num2 = Int(secondNumber.text!) ?? 0
        
        Result.text = String(num1/num2)
    }
    
    
}


