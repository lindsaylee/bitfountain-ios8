//
//  ViewController.swift
//  AgeOfLaika
//
//  Created by Lindsay Lee Siovaila on 10/3/14.
//  Copyright (c) 2014 lindsay.siovaila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var humanYearsTextField: UITextField!
    @IBOutlet weak var dogYearsConvertedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertBtnPressed(sender: UIButton) {
        let yearsFromTextField = Double((humanYearsTextField.text as NSString).doubleValue)
        dogYearsConvertedLabel.hidden = false
        
        if yearsFromTextField <= 2 {
        
            dogYearsConvertedLabel.text = "\(yearsFromTextField * 10.5)" + " in human years"
            
        } else if yearsFromTextField > 2 {
            
            dogYearsConvertedLabel.text = "\(21 + ((yearsFromTextField-2) * 4))" + " in human years"
        }
        
        humanYearsTextField.resignFirstResponder()
        
    }

}

