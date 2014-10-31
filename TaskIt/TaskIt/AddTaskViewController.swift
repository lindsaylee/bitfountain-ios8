//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Lindsay Lee Siovaila on 10/29/14.
//  Copyright (c) 2014 lindsay.siovaila. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Use this button because you don't have access to the navigation controls because this is on a modal
    @IBAction func cancelButtonTapped(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
