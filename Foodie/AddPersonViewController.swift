//
//  AddPersonViewController.swift
//  Foodie
//
//  Created by Trever on 3/6/15.
//  Copyright (c) 2015 Trever Pehrson. All rights reserved.
//

import UIKit
import CoreData

class AddPersonViewController: UIViewController {

    let moc = CoreDataManager.singleton.managedObjectContext!
    
    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancel() {
        dismissViewController()
    }

    @IBAction func save() {
        let person = NSEntityDescription.insertNewObjectForEntityForName("Person", inManagedObjectContext: moc) as Person
        
        if (nameTextField.text != nil) {
            person.name = nameTextField.text
        }
        
        var error: NSError? = nil
        moc.save(&error)
        if (error != nil) {
            println("an error occurred while saving moc: \(error)")
        }
        
        dismissViewController()
    }
    
    
    func dismissViewController() {
        navigationController?.popViewControllerAnimated(true)
    }
    
}
