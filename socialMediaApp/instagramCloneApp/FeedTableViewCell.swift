//
//  FeedTableViewCell.swift
//  instagramCloneApp
//
//  Created by Semih Güney on 16.01.2026.
//

import UIKit
import Firebase

class FeedTableViewCell: UITableViewCell {


    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var mailLabel: UILabel!
    
    @IBOutlet weak var likeCount: UILabel!
    
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func likeClicked(_ sender: Any) {
        
        let db = Firestore.firestore()
        
        if let likeEnd = Int(likeCount.text!) {
            
            let newLike = ["likes" : likeEnd + 1] as [String : Any]
            
            db.collection("Posts").document(userIdLabel.text!).setData(newLike, merge: true)
            
        }
        
        
    }
}
