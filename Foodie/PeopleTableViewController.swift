//
//  PeopleTableViewController.swift
//  Foodie
//
//  Created by Trever on 3/6/15.
//  Copyright (c) 2015 Trever Pehrson. All rights reserved.
//

import UIKit
import CoreData

class PeopleTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let moc = CoreDataManager.singleton.managedObjectContext!
    
    lazy var fetchRequest: NSFetchRequest = {
        let fr = NSFetchRequest(entityName: "Person")
        fr.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
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
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("people cell", forIndexPath: indexPath) as UITableViewCell
        let person = fetchedResultsController.objectAtIndexPath(indexPath) as Person
        
        cell.textLabel?.text = person.name

        return cell
    }

       // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "myFoodSegue" {
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let person = fetchedResultsController.objectAtIndexPath(indexPath!) as Person
            let myFoodTVC = segue.destinationViewController as MyFoodTableViewController
            myFoodTVC.person = person
            println("\(person.name)")
        }
    }

}
