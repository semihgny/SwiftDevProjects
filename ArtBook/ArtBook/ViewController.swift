//
//  ViewController.swift
//  ArtBook
//
//  Created by Semih Güney on 22.05.2024.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var nameArray = [String]()
    var idArray = [UUID]()
    var selectedPainting = ""
    var selectedID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButton))
        
        getFetch()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(getFetch), name: NSNotification.Name(rawValue: "newData"), object: nil)
        
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
    
    @objc func addButton(){
        
        selectedPainting = ""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
 
    @objc func getFetch(){
        
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        
        do{
            let results = try context.fetch(fetchRequest)
            if results.count > 0{
                
            
            for result in results as! [NSManagedObject]{
                
                if let name = result.value(forKey: "name") as? String{
                    nameArray.append(name)
                }
                if let id = result.value(forKey: "id") as? UUID{
                    idArray.append(id)
                }
            }
            tableView.reloadData()
        }
        }
        catch {
            print("Error")
        }
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            
            let destinitionVC = segue.destination as! DetailsVC
            destinitionVC.chosenID = selectedID
            destinitionVC.chosenPainting = selectedPainting
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedID = idArray[indexPath.row]
        selectedPainting = nameArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)

    }
 
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            let idString = idArray[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject]{
                        
                        if let id = result.value(forKey: "id") as? UUID {
                            
                            if id == idArray[indexPath.row] {
                                
                                nameArray.remove(at: indexPath.row)
                                idArray.remove(at: indexPath.row)
                                
                                context.delete(result)
                                
                                self.tableView.reloadData()
                                
                                do{
        
                                    try context.save()
                                    
                                } catch {
                                    
                                    print("error")
                                    
                                }
                                
                                break
                                
                            }
                        }
                        
                    }
                    
                }
                
            } catch {
                
                print("Error")
                
            }
            
            
        }
        
        
    }
    
}

    
