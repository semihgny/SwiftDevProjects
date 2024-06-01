//
//  ViewController.swift
//  artBookAppe
//
//  Created by Semih Güney on 31.05.2024.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var TableView: UITableView!
    
    var idArray = [UUID]()
    var nameArray = [String]()
    
    var selectedID = UUID()
    var selectedPainting = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButton))
        
        getData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "newData"), object: nil)
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        
        content.text = nameArray[indexPath.row]
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedID = idArray[indexPath.row]
        selectedPainting = nameArray[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    
   @objc func getData(){
       
       idArray.removeAll(keepingCapacity: false)
       nameArray.removeAll(keepingCapacity: false)
       
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        
        do{
            
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject]{
                
                if let name = result.value(forKey: "name") as? String{
                    
                    nameArray.append(name)
                    
                }
                
                if let id = result.value(forKey: "id") as? UUID{
                    
                    idArray.append(id)
                    
                }
                
                
                
            }
            
        } catch {
            
            print("error")
            
        }
     
        self.TableView.reloadData()
        
    }
    
    @objc func addButton(){
        selectedPainting = ""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            
            let destinationVC = segue.destination as! DetailsVC
            
            destinationVC.choosenID = selectedID
            destinationVC.choosenPainting = selectedPainting
            
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let id = idArray[indexPath.row]
            let idString = id.uuidString
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            do {
            
                let results = try context.fetch(fetchRequest)
                
                for result in results as! [NSManagedObject] {
                    
                    if let idS = result.value(forKey: "id") as? UUID {
                        
                        if idS == id {
                            
                            idArray.remove(at: indexPath.row)
                            nameArray.remove(at: indexPath.row)
                            
                            context.delete(result)
                            
                            do{
                                
                                try context.save()
                                
                            } catch {
                                
                                print("error")
                                
                            }
                            
                            tableView.reloadData()
                            
                        }
                        
                    }
                    
                }
                
            } catch {
                
                print("error")
                
            }
            
            
        }
        
    }
    
}

