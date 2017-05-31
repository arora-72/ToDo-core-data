//
//  addTaskViewController.swift
//  toDo app
//
//  Created by arora_72 on 31/05/17.
//  Copyright © 2017 indresh arora. All rights reserved.
//

import UIKit

class addTaskViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var isImp: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    @IBAction func btnTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        let task = Task(context: context)
        
        task.name = textField.text!
        task.isImportant = isImp.isOn
        
        
        //save the data in the core data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //navigationController!.popViewController(animated: true)
        navigationController!.popViewController(animated: true)
        
    }
    
    
    
}
