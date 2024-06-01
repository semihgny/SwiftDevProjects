//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Semih Güney on 19.05.2024.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedName = ""
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkLabel.text = selectedName
        imageView.image = selectedImage


    }
}
