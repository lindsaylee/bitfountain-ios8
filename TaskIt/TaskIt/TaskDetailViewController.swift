//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Lindsay Lee Siovaila on 10/28/14.
//  Copyright (c) 2014 lindsay.siovaila. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    //This allows us to pass a Task into the TaskDetailViewController
    var detailTaskModel: TaskModel!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextFiels: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.taskTextField.text = detailTaskModel.task
        self.subtaskTextFiels.text = detailTaskModel.subTask
        self.dueDatePicker.date = detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
