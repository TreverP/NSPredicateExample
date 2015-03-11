//
//  MyFoodTableViewController.swift
//  Foodie
//
//  Created by Trever on 3/6/15.
//  Copyright (c) 2015 Trever Pehrson. All rights reserved.
//

import UIKit
import CoreData

class MyFoodTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let moc = CoreDataManager.singleton.managedObjectContext!
    
    var person: Person!
    
    lazy var fetchRequest: NSFetchRequest = {
        let fr = NSFetchRequest(entityName: "Food")
        fr.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        fr.predicate = NSPredicate(format: "person.name  == %@", self.person.name)
        
        return fr
        }()
    
    lazy var fetchedResultsController: NSFetchedResultsController = {
        var frc: NSFetchedResultsController = NSFetchedResultsController(fetchRequest: self.fetchRequest, managedObjectContext: self.moc, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        
        return frc
        }()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        refresh()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Person: \(person)")
        println("Person Desc: \(person.description)")
        println("Person Name: \(person.name)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func refresh() {
        
        fetchedResultsController.performFetch(nil)
        self.tableView.reloadData()
    }


    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return fetchedResultsController.fetchedObjects?.count ?? 0
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("my food cell", forIndexPath: indexPath) as UITableViewCell
        var food = fetchedResultsController.objectAtIndexPath(indexPath) as Food
        
        cell.textLabel?.text = food.title
        println("Food object: \(food.description)")
        println("Food.Title: \(food.title)")
        println("Food.Person: \(food.person.name)")
        
        return cell
    }


    // MARK: - Navigation addFoodSegue

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addFoodSegue" {
            let addFoodVC = segue.destinationViewController as AddFoodViewController
            addFoodVC.person = person
        }

        
    }

}
