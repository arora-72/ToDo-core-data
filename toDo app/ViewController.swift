//
//  ViewController.swift
//  toDo app
//
//  Created by arora_72 on 31/05/17.
//  Copyright © 2017 indresh arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //get the data from core data
        fetchData()
        
        //reload the table view
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        if task.isImportant{
            
            cell.textLabel?.text = "\(task.name!)"
        }else{
        
            cell.textLabel?.text = task.name!
        }
        
        
        return cell
    }
    
    
    func fetchData(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        do{
        tasks = try context.fetch(Task.fetchRequest())
        }catch{
            
            //handle exception
            print("fetching failed")
        }
    }
  
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete{
            let task = tasks[indexPath.row]
            context.delete(task)
            
            //saving the context
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do{
            tasks = try context.fetch(Task.fetchRequest())
            }
            catch{
                print("error in deleting")
            }
        }
        
        tableView.reloadData()
        
    }
    
    

}

