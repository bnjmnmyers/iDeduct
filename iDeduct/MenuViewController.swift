//
//  MenuViewController.swift
//  iDeduct
//
//  Created by Benjamin Myers on 3/8/15.
//  Copyright (c) 2015 AppGuys. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var titleLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        sizeElements()
    }
    
    func sizeElements(){
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        switch screenWidth {
        case 320:
            titleLBL.font = UIFont(name: titleLBL.font.fontName, size: 70)
        case 375:
            titleLBL.font = UIFont(name: titleLBL.font.fontName, size: 84)
            println()
        default:
            titleLBL.font = UIFont(name: titleLBL.font.fontName, size: 96)
            println()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

