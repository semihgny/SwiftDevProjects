//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Semih Güney on 19.05.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var chosenName = ""
    var chosenImage = UIImage()
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stone Henge")
        landmarkNames.append("Taj Mahal")
        
        
        landmarkImages.append(UIImage(named: "colosseum")!)
        landmarkImages.append(UIImage(named: "greatWall")!)
        landmarkImages.append(UIImage(named: "kremlin")!)
        landmarkImages.append(UIImage(named: "stonehenge")!)
        landmarkImages.append(UIImage(named: "tajMahal")!)
        
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return landmarkNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
        
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenName = landmarkNames[indexPath.row]
        chosenImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailsVC" {
            
            let destinitionVC = segue.destination as! DetailsVC
            
            destinitionVC.selectedName = chosenName
            destinitionVC.selectedImage = chosenImage
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
}

