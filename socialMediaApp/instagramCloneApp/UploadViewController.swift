//
//  UploadViewController.swift
//  instagramCloneApp
//
//  Created by Semih Güney on 14.01.2026.
//

import UIKit
import FirebaseStorage
import Firebase
import FirebaseAuth

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var uploadImage: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var commentText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageGes = UITapGestureRecognizer(target: self, action: #selector(imageClicked))
        
        uploadImage.isUserInteractionEnabled = true
        uploadImage.addGestureRecognizer(imageGes)
        
        shareButton.isEnabled = false
        

    }
    
    func makeAlert(titleInput : String, messageInput : String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func imageClicked(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.isEditing = true
        present(picker, animated: true)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        uploadImage.image = info[.originalImage] as? UIImage
        shareButton.isEnabled = true
        
        picker.dismiss(animated: true)
    }
    
    @IBAction func shareClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        let referances = storage.reference()
        
        let uuidAddress = UUID().uuidString
        
        let mediaReferance = referances.child("Media")
        let imageReferance = mediaReferance.child("\(uuidAddress).jpg")
        
        
        if let imageData = uploadImage.image?.jpegData(compressionQuality: 0.8){
            imageReferance.putData(imageData, metadata: nil) { metaData, error in
                if error != nil {
                    
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "error")

                    
                } else {
                    
                    imageReferance.downloadURL { url, error in
                        if error == nil {
                            let urlAdress = url?.absoluteString
                            
                            //DATABASE
                            
                            let fireDB = Firestore.firestore()
                            var fireReferences : DocumentReference? = nil
                            
                            let firePosts = ["imageUrl" : urlAdress!, "postedBy" : Auth.auth().currentUser?.email , "postComment" : self.commentText.text!, "date" : FieldValue.serverTimestamp() ,"likes" : 0] as [String : Any]
                            
                            fireReferences = fireDB.collection("Posts").addDocument(data: firePosts, completion: { error in
                                if error != nil {
                                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                                } else {
                                    
                                    self.uploadImage.image = UIImage(systemName: "square.and.arrow.up.fill")
                                    self.commentText.text = ""
                                    self.tabBarController?.selectedIndex = 0

                                    
                                }
                            } )
                            
                        } else {
                            self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "error")
                        }
                        
                    }
                    
                }
            }
        }
    }
}
