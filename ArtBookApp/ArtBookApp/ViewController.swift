//
//  ViewController.swift
//  ArtBookApp
//
//  Created by Semih Güney on 31.05.2024.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var idArray = [UUID]()
    var nameArray = [String]()
    var selectedPainting = ""
    var selectedID = UUID()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        getData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(newData), name: NSNotification.Name(rawValue: "newData"), object: nil)
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
    
    func getData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        
        nameArray.removeAll(keepingCapacity: false)
        
        idArray.removeAll(keepingCapacity: false)
        
        do{
            
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject]
            {
                if let name = result.value(forKey: "name") as? String {
                   
                    nameArray.append(name)
                    
                }
                
                if let id = result.value(forKey: "id") as? UUID {
                    
                    idArray.append(id)
                    
                }
                
                tableView.reloadData()

                print("Succes")

            }
            
        } catch {
            
            print("error")
            
        }
    }

    @objc func addButtonClicked(){
        
        selectedPainting = ""
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailsVC" {
            
        let destinationVC = segue.destination as! DetailsVC
        
            destinationVC.choosenId = selectedID
            destinationVC.choosenPainting = selectedPainting
            
            
        }
    }
    

    
    @objc func newData(){
        
        getData()
        
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let Cid = idArray[indexPath.row]
            
            let idString = Cid.uuidString
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            
            do{
                let results = try context.fetch(fetchRequest)
                
                for result in results as! [NSManagedObject]{
                    
                    if let id = result.value(forKey: "id") as? UUID {
                        
                        if id == Cid {
                            
                            context.delete(result)
                            idArray.remove(at: indexPath.row)
                            nameArray.remove(at: indexPath.row)
                            
                            self.tableView.reloadData()
                            
                            do{
                                try context.save()
                            }
                            catch {
                                print("error")
                            }
                            
                        }
                        
                    }
                    
                }
            } catch {
                
                
                print("error")
                
                
            }
            
            
            
            
        }
        
    }
    
}


