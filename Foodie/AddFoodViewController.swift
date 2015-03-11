//
//  AddFoodViewController.swift
//  Foodie
//
//  Created by Trever on 3/6/15.
//  Copyright (c) 2015 Trever Pehrson. All rights reserved.
//

import UIKit
import CoreData

class AddFoodViewController: UIViewController {
    
    let moc = CoreDataManager.singleton.managedObjectContext!
    
    var person: Person? = nil
    
    var MyFoodTVC: MyFoodTableViewController? = nil
    
    @IBOutlet var foodTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancel() {

        dismissViewController()
    }
    
    @IBAction func save() {
        
        let food = NSEntityDescription.insertNewObjectForEntityForName("Food", inManagedObjectContext: moc) as Food
        
        if (foodTextField.text != nil) {
            food.title = foodTextField.text
            food.person = self.person!
        }
        
        var error: NSError? = nil
        moc.save(&error)
        if (error != nil) {
            println("an error occurred while saving moc: \(error)")
        }
        
        MyFoodTVC?.person = food.person
        dismissViewController()

    }
    
    func dismissViewController() {
        navigationController?.popViewControllerAnimated(true)
    }


}

