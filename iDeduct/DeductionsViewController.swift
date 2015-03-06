//
//  DeductionsViewController.swift
//  iDeduct
//
//  Created by Benjamin Myers on 2/21/15.
//  Copyright (c) 2015 AppGuys. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class DeductionsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var deductions = [Deduction]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var appDell:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var managedObjectContext:NSManagedObjectContext = appDell.managedObjectContext!
        
        var fetchRequest = NSFetchRequest(entityName: "Deduction")
        fetchRequest.returnsObjectsAsFaults = false
        
        var error:NSError?
        if let results = managedObjectContext.executeFetchRequest(fetchRequest, error: &error) as? [Deduction]{
//            for result in results as [Deduction]{
//                deductions.append(result)
//            }
            deductions = results
        }
        println(deductions.count)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deductions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:DeductionViewCell = tableView.dequeueReusableCellWithIdentifier("DeductionCell") as DeductionViewCell
        let deduction = deductions[indexPath.row]
        let deductionPrice = deduction.valueForKey("price")?.stringValue
        let deductionDate = deduction.valueForKey("purchaseDate")? as NSDate
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-YYYY"
        cell.deductionDate?.text = dateFormatter.stringFromDate(deductionDate)
        cell.deductionName?.text = deduction.valueForKey("itemName") as? String
        cell.deductionPrice?.text = "$"+deductionPrice!
        
        return cell
    }
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            var appDell:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            var managedObjectContext:NSManagedObjectContext = appDell.managedObjectContext!
            managedObjectContext.deleteObject(deductions[indexPath.row] as NSManagedObject)
            deductions.removeAtIndex(indexPath.row)
            managedObjectContext.save(nil)
            
            //tableView.reloadData()
            // remove the deleted item from the `UITableView`
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

        }
    }

}

class DeductionViewCell: UITableViewCell {
    
    @IBOutlet weak var deductionName: UILabel!
    @IBOutlet weak var deductionPrice: UILabel!
    @IBOutlet weak var deductionDate: UILabel!
}


