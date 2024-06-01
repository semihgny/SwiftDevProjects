//
//  DetailsVC.swift
//  ArtBook
//
//  Created by Semih Güney on 22.05.2024.
//

import UIKit
import CoreData

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var artistText: UITextField!
    
    @IBOutlet weak var yearText: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var chosenPainting = ""
    var chosenID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if chosenPainting != "" {
        
            saveButton.isHidden = true
            
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appdelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
 
            let stringUUID = chosenID?.uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", stringUUID!)
            fetchRequest.returnsObjectsAsFaults = false
            
            
            do{
                
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                
                    for result in results as! [NSManagedObject]{
                        
                        if let name = result.value(forKey: "name") as? String{
                            
                            nameText.text = name
                            
                        }
                        
                        if let artist = result.value(forKey: "artist") as? String{
                            
                            artistText.text = artist
                            
                        }
                        
                        if let year = result.value(forKey: "year") as? Int{
                            
                            yearText.text = String(year)
                            
                        }
                        
                        if let image = result.value(forKey: "image") as? Data{
                            
                            imageView.image = UIImage(data: image)
                            
                        }
 
                    }
                    
                    
                }
            }
            
            catch {
                
                print("error")
                
            }
            
            
            
            
        }
        else
        {
            
            saveButton.isHidden = false
            saveButton.isEnabled = false
            
            nameText.text = ""
            artistText.text = ""
            yearText.text = ""
            
        }
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        
        imageView.isUserInteractionEnabled = true
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(selectedImage))
        imageView.addGestureRecognizer(imageGesture)
    }
    

    @objc func selectedImage(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        present(picker, animated: true)
        
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        
        saveButton.isEnabled = true
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let paintings = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        paintings.setValue(nameText.text!, forKey: "name")
        paintings.setValue(artistText.text!, forKey: "artist")
        paintings.setValue(UUID(), forKey: "id")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        paintings.setValue(data, forKey: "image")
        
        if let year = Int(yearText.text!){
            
            paintings.setValue(year, forKey: "year")
            
        }
        
        do{
            
            try context.save()
            print("succes")
        }
        catch {
            print("error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        navigationController?.popViewController(animated: true)
        
        
    }
    
    
    @objc func hideKeyboard(){
        
        view.endEditing(true)
        
    }
    
    
}
