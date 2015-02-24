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
    @IBOutlet weak var selectCategoryBTN: UIButton!
    
    @IBOutlet weak var categoryPickerContainer: UIView!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var categoryPickerDone: UIButton!
    
    // Variable Properties
    //
    var currentTextField: UITextField!
    let categories = ["Music", "Electronics", "Software", "Travel", "Dancewear"]
    
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
        if currentTextField != nil{
            currentTextField.endEditing(true)
        }
    }
    
    @IBAction func setDate(sender: AnyObject) {
        datePickerContainer.hidden = false
        if currentTextField != nil{
            currentTextField.endEditing(true)
        }
    }
    
    @IBAction func selectCategory(sender: AnyObject) {
        categoryPickerContainer.hidden = false
        if currentTextField != nil{
            currentTextField.endEditing(true)
        }
    }
    
    @IBAction func closeDatePicker(sender: AnyObject) {
        datePickerContainer.hidden = true
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        var stringDate = dateFormatter.stringFromDate(datePicker.date)
        setDateBTN.titleLabel?.text = stringDate
    }
    
    @IBAction func closeCategoryPicker(sender: AnyObject) {
        categoryPickerContainer.hidden = true
    }
    
    // MARK: CategoriesPickerView Methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return categories.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return categories[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        selectCategoryBTN.titleLabel?.text = "\(categories[row])"
        
    }
}
