//
//  ViewController.swift
//  TaskIt
//
//  Created by Lindsay Lee Siovaila on 10/27/14.
//  Copyright (c) 2014 lindsay.siovaila. All rights reserved.
//

import UIKit

//UITableViewDataSource & UITableViewDelegate gives access to additional functions
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    
    //*** 1. Create a global array named taskArray where dictionaries are stored. The dictionaries will store Task information
    var taskArray:[Dictionary<String,String>] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //*** 2. Create 3 dictionaries which will have keys that are strings and values that are strings. Notice that for each Dictionary we set a "key-value" pair separated by a comma
        let task1:Dictionary<String, String> = ["task": "Study French", "subtask": "Verbs", "date": "01/14/2014"]
        let task2:Dictionary<String, String> = ["task": "Eat dinner", "subtask": "Burgers", "date": "01/14/2014"]
        let task3:Dictionary<String, String> = ["task": "Gym", "subtask": "Pushups", "date": "01/14/2014"]
        
        //*** 3. Add each Dictionary to the taskArray
        taskArray = [task1, task2, task3]
        
        //*** 4. We can now call the reloadData function on our tableView. This will refresh our TableView and recal the UITableViewDataSource functions
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //*** 5. We want to update our UITableViewDataSource functions. We'll start by having the number of TableViews be dynamic based on the number of Dictionary instances in our taskArray
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        //*** 6. Update the function cellForRowAtIndexPath. Use the dictionaries we added to taskArray to update the cell. In order to add an instance in our TaskArray use the parameter "indexPath" passed into the function.
        
        //*** IndexPath has a property of "row" which specifys the row being populated. In this case, we have 3 rows in our TableView, so the function cellForRowAtIndexPath will be called 3 times. Each time it is called, the value of "row" will increase by 1 starting at 0. 
        let taskDict:Dictionary = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        cell.taskLabel.text = taskDict["task"]
        cell.descriptionLabel.text = taskDict["subtask"]
        cell.dateLabel.text = taskDict["date"]
        
        return cell
    }
    
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }


}

