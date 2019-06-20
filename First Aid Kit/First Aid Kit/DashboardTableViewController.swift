//
//  DashboardTableViewController.swift
//  First Aid Kit
//
//  Created by Aleksey Koptelin on 21/06/2019.
//  Copyright © 2019 Aleksey Koptelin. All rights reserved.
//

import UIKit
import CoreData

class DashboardTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var fetchedResultsController = CoreDataManager.instance.fetchedResultsController(entityName: "Medicament", keyForSort: "expires")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchedResultsController.delegate = self as NSFetchedResultsControllerDelegate
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
    }

    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
        let addButton = UIBarButtonItem(
            title: "Add",
            style: .plain,
            target: self,
            action: #selector(self.AddMedicament)
        )
        
        navigationController?.navigationBar.topItem?.title = "Dashboard"
        navigationController?.navigationBar.topItem?.leftBarButtonItem = nil
        navigationController?.navigationBar.topItem?.rightBarButtonItem = addButton
    }
    
    @IBAction func AddMedicament(_ sender: Any) {
        performSegue(withIdentifier: "dashboardToMedicament", sender: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let medicament = fetchedResultsController.object(at: indexPath) as! Medicament
        let cell = UITableViewCell()
        cell.textLabel?.text = medicament.name
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let managedObject = fetchedResultsController.object(at: indexPath) as! NSManagedObject
            CoreDataManager.instance.persistentContainer.viewContext.delete(managedObject)
            CoreDataManager.instance.saveContext()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let medicament = fetchedResultsController.object(at: indexPath) as? Medicament
        performSegue(withIdentifier: "dashboardToMedicament", sender: medicament)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dashboardToMedicament" {
            let controller = segue.destination as! MedicamentViewController
            controller.medicament = sender as? Medicament
        }
    }
    
    // MARK: - Fetched Results Controller Delegate
    
    private func controllerWillChangeContent(controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    private func controller(controller: NSFetchedResultsController<NSFetchRequestResult>, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath {
                let category = fetchedResultsController.object(at: indexPath as IndexPath) as! Category
                let cell = tableView.cellForRow(at: indexPath as IndexPath)
                cell!.textLabel?.text = category.name
            }
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            }
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath as IndexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            }
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

}
