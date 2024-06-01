//
//  DetailsVC.swift
//  SimpsonBookApp
//
//  Created by Semih Güney on 20.05.2024.
//

import UIKit

class DetailsVC: UIViewController{

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var jobLabel: UILabel!
    
    var selectedSimpson : simpsons?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image

    }
    


}
