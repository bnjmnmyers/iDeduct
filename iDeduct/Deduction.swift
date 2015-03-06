//
//  Deduction.swift
//  iDeduct
//
//  Created by Benjamin Myers on 3/5/15.
//  Copyright (c) 2015 AppGuys. All rights reserved.
//

import Foundation
import CoreData

@objc(Deduction)
class Deduction: NSManagedObject {

    @NSManaged var purchaseDate: NSDate
    @NSManaged var itemName: String
    @NSManaged var price: NSDecimalNumber
    @NSManaged var category: String

}
