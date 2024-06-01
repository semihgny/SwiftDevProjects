//
//  DetailsVC.swift
//  artBookAppe
//
//  Created by Semih Güney on 31.05.2024.
//

import UIKit
import CoreData

class DetailsVC: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var nameText: UITextField!
    
    
    @IBOutlet weak var artistText: UITextField!
    
    
    @IBOutlet weak var DateText: UITextField!
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    var choosenPainting = ""
    var choosenID = UUID()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let keyboardGesture = UITapGestureRecognizer(target: self, action: #selector(keyboard))
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        
        view.addGestureRecognizer(keyboardGesture)
        imageView.addGestureRecognizer(imageGesture)
        
        if choosenPainting != ""{
            
            imageView.isUserInteractionEnabled = false
            
            saveButton.isHidden = true
            
            let idString = choosenID.uuidString
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            do{
                
                let results = try context.fetch(fetchRequest)
                
                
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        if let image = result.value(forKey: "image") as? Data {
                            
                            let imageUI = UIImage(data: image)
                            
                            imageView.image = imageUI
                            
                            
                        }
                        if let name = result.value(forKey: "name") as? String {
                            
                            nameText.text = name
                            
                        }
                        
                        if let artist = result.value(forKey: "artist") as? String {
                            
                            artistText.text = artist
                            
                        }
                        
                        if let date = result.value(forKey: "date") as? Int {
                            
                            DateText.text = String(date)
                            
                        }
                    }
                }
            }
            
            catch {
                
                print("error")
                
            }
        
        }
        
        else{
            
            saveButton.isHidden = false
            saveButton.isEnabled = false
            
            nameText.text = ""
            artistText.text = ""
            DateText.text = ""
            
        }
        
    }
    
    @objc func keyboard(){
        
        view.endEditing(true)
        
    }
    
    @objc func selectImage(){
        
    print("succes")
        
        let Picker = UIImagePickerController()
        Picker.delegate = self
        
        Picker.sourceType = .photoLibrary
        Picker.allowsEditing = true
        
        present(Picker, animated: true, completion: nil)
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        let name = nameText.text
            
        saveData.setValue(name, forKey: "name")
       
        let id = UUID()
        
        saveData.setValue(id, forKey: "id")
        
        let artist = artistText.text
            
        saveData.setValue(artist, forKey: "artist")
            
    
        if let date = Int(DateText.text!) {
            
            saveData.setValue(date, forKey: "date")
            
        }
        
        let image = imageView.image?.jpegData(compressionQuality: 0.5)
        
        saveData.setValue(image, forKey: "image")
        
        navigationController?.popViewController(animated: true)

        
        do{
            
            try context.save()
            
        } catch {
            
            print("error")
            
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newData"), object: nil)
        
    }
    
}
