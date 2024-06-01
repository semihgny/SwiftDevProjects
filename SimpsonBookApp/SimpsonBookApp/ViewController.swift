//
//  ViewController.swift
//  SimpsonBookApp
//
//  Created by Semih Güney on 20.05.2024.
//

import UIKit

class ViewController:  UIViewController , UITableViewDelegate , UITableViewDataSource {



    @IBOutlet weak var tableView: UITableView!
    
    var chosenSimpson : simpsons?
    var homeArray = [simpsons]()
       
    var bart = simpsons(sName: "Bart Simpson", sJob: "Student", sImage: UIImage(named: "bart.jpg")!)
    var homer = simpsons(sName: "Homer Simpson", sJob: "Nuclear Safety", sImage: UIImage(named: "homer.jpg")!)
    var lisa = simpsons(sName: "Lisa Simpson", sJob: "Student", sImage: UIImage(named: "lisa.jpg")!)
    var maggie = simpsons(sName: "Maggie Simpson", sJob: "Baby", sImage: UIImage(named: "maggie.jpg")!)
    var marge = simpsons(sName: "Marge Simpson", sJob: "Housewife", sImage: UIImage(named: "marge.jpg")!)
    
    
       override func viewDidLoad() {
           super.viewDidLoad()

           tableView.delegate = self
           tableView.dataSource = self
           
           homeArray.append(homer)
           homeArray.append(marge)
           homeArray.append(bart)
           homeArray.append(lisa)
           homeArray.append(maggie)
           

           
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           return homeArray.count
           
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell = UITableViewCell()
           
           var content = cell.defaultContentConfiguration()
           
           content.text = homeArray[indexPath.row].name
           cell.contentConfiguration = content

           return cell
       }
       
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenSimpson = homeArray[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailsVC"
        {
            
            let destinationVC = segue.destination as! DetailsVC
            
            destinationVC.selectedSimpson = chosenSimpson
            
        }
        
    }
    
   }

