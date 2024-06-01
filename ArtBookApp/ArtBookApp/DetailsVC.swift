//
//  DetailsVC.swift
//  ArtBookApp
//
//  Created by Semih Güney on 31.05.2024.
//

import UIKit
import CoreData


class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var nameText: UITextField!
    
    
    @IBOutlet weak var artistText: UITextField!
    
    
    @IBOutlet weak var dateText: UITextField!
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    var choosenPainting = ""
    var choosenId = UUID()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        if choosenPainting != "" {
            
            saveButton.isHidden = true
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            let idString = choosenId.uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
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
                        
                        if let date = result.value(forKey: "date") as? Int{
                            
                            dateText.text = String(date)
                            
                        }
                        
                        if let image = result.value(forKey: "image") as? Data{
                            
                            let imageUI = UIImage(data: image)
                            
                            imageView.image = imageUI
                            
                        }
                        
                    }
                    
                    
                }
            }
            
            catch {
                
                print("error")
                
            }
            
        }
        
        else {
            
            saveButton.isHidden = false
            saveButton.isEnabled = false
            
            nameText.text = ""
            artistText.text = ""
            dateText.text = ""
            
        }
        
        imageView.isUserInteractionEnabled = true

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        
        let keyboardGesture = UITapGestureRecognizer(target: self, action: #selector(keyboard))
        
        imageView.addGestureRecognizer(gestureRecognizer)
        view.addGestureRecognizer(keyboardGesture)
        
        
    }
    

    
    @objc func selectImage(){
        
        let picker = UIImagePickerController()
      
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
        
        
        
        
    }
    
    @objc func keyboard(){
        
        view.endEditing(true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let savePaint = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
    
        savePaint.setValue(nameText.text, forKey: "name")
    
        savePaint.setValue(artistText.text, forKey: "artist")
        
        savePaint.setValue(UUID(), forKey: "id")
        
        
        if let date = Int(dateText.text!) {
        
            savePaint.setValue(date, forKey: "date")
            
        }
        
        let image = imageView.image?.jpegData(compressionQuality: 0.5)
        
        savePaint.setValue(image, forKey: "image")
        
        
        do{
            
            try context.save()
            print("succes")
            
        } catch {
            
            print("error")
            
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newData"), object: nil)
        
        navigationController?.popViewController(animated: true)
    }
   
    
}
