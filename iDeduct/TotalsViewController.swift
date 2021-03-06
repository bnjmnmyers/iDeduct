//
//  ViewController.swift
//  iDeduct
//
//  Created by Benjamin Myers on 2/21/15.
//  Copyright (c) 2015 AppGuys. All rights reserved.
//

import UIKit
import CoreData

class TotalsViewController: UIViewController {

    @IBOutlet weak var deductionsTotalLBL: UILabel!
	var deductionTotal:NSDecimalNumber! = 0.00
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		var appDell:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
		var managedObjectContext:NSManagedObjectContext = appDell.managedObjectContext!
		
		var fetchRequest = NSFetchRequest(entityName: "Deduction")
		fetchRequest.returnsObjectsAsFaults = false
		
		var error:NSError?
		if let results = managedObjectContext.executeFetchRequest(fetchRequest, error: &error) as? [Deduction]{
			for result in results as [Deduction]{
				deductionTotal = deductionTotal.decimalNumberByAdding(result.price)
			}
		}
        var numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .CurrencyStyle
        var deductionTotalString = numberFormatter.stringFromNumber(deductionTotal)!
		deductionsTotalLBL.text = deductionTotalString
    }
	
    override func viewWillAppear(animated: Bool) {
        sizeElements()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func sizeElements(){
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        switch screenWidth {
        case 320:
            deductionsTotalLBL.font = UIFont(name: deductionsTotalLBL.font.fontName, size: 60)
        case 375:
            deductionsTotalLBL.font = UIFont(name: deductionsTotalLBL.font.fontName, size: 70)
            println()
        default:
            deductionsTotalLBL.font = UIFont(name: deductionsTotalLBL.font.fontName, size: 78)
            println()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
}

