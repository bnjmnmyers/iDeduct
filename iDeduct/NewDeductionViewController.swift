//
//  NewDeductionViewController.swift
//  iDeduct
//
//  Created by Benjamin Myers on 2/21/15.
//  Copyright (c) 2015 AppGuys. All rights reserved.
//

import Foundation
import UIKit

class NewDeductionViewController: UIViewController, UITextFieldDelegate {
    
    // Interface Properties
    //
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerContainer: UIView!
    @IBOutlet weak var datePickerDone: UIButton!
    @IBOutlet weak var itemNameTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var setDateBTN: UIButton!
    
    // Variable Properties
    //
    var currentTextField: UITextField!
    
    
    // Functions
    //
    override func viewDidLoad() {
        // TODO: DO STUFF
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        currentTextField = textField
        datePickerContainer.hidden = true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        currentTextField.endEditing(true)
    }
    
    @IBAction func setDate(sender: AnyObject) {
        datePickerContainer.hidden = false
    }
    
    @IBAction func closeDatePicker(sender: AnyObject) {
        datePickerContainer.hidden = true
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        var stringDate = dateFormatter.stringFromDate(datePicker.date)
        setDateBTN.titleLabel?.text = stringDate
    }
}
