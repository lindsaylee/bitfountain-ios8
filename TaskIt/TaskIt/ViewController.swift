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
    //var taskArray:[Dictionary<String,String>] = []
    //*** Refactored the code to store a struct called TaskModel
    var taskArray:[TaskModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let date1 = Date.from(year: 2014, month: 05, day: 20)
        let date2 = Date.from(year: 2014, month: 03, day: 3)
        let date3 = Date.from(year: 2014, month: 12, day: 13)
        
        
        //*** 2. Create 3 dictionaries which will have keys that are strings and values that are strings. Notice that for each Dictionary we set a "key-value" pair separated by a comma
        //let task1:Dictionary<String, String> = ["task": "Study French", "subtask": "Verbs", "date": "01/14/2014"]
        //let task2:Dictionary<String, String> = ["task": "Eat dinner", "subtask": "Burgers", "date": "01/14/2014"]
        //let task3:Dictionary<String, String> = ["task": "Gym", "subtask": "Pushups", "date": "01/14/2014"]
        //*** Refactored the code to create the tasks using the TaskModel struct
        
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: date1)
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: date2)
        let task3 = TaskModel(task: "Gym", subTask: "Pushups", date: date3)
        
        
        //*** 3. Add each Dictionary to the taskArray
        //*** Add each item from the struct TaskModel to the taskArray
        taskArray = [task1, task2, task3]
        
        //*** 4. We can now call the reloadData function on our tableView. This will refresh our TableView and recal the UITableViewDataSource functions
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //This is passed before the segue takes place
    //Use an if statement to ensure the proper transition is occurring since multiple segures can occur from the ViewController
    //Therefore - use the identifier property of the segue to confirm that it is the same name
    //We can then access the instance of the TaskDetailViewControoler that will be presented on the screen by accessing the destination ViewController preperty of the segue
    //With the instance of the TaskDetailViewController we can then set the property of the TaskDetailViewController to be the selected Task.
    //In order to figure out which Task was selected we use the function indexPathForSelected() to determine which NSIndexPath was selected in the tableView
    //We can then use the row property of the NSIndexPath instance to determine which row was tapped
    //We can then index into the taskArray and access the appropriate Task
    //We can then set the TaskDetailViewController's detail TaskModel property to be the appropriate Task
    //Now the TaskDetailViewController will have access to a Task when it accesses the detailTaskModel property
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //Determines if the segue is showTaskDetail
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
        }
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //*** 5. We want to update our UITableViewDataSource functions. We'll start by having the number of TableViews be dynamic based on the number of Dictionary instances in our taskArray
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        //*** 6. Update the function cellForRowAtIndexPath. Use the dictionaries we added to taskArray to update the cell. In order to add an instance in our TaskArray use the parameter "indexPath" passed into the function.
        
        //*** IndexPath has a property of "row" which specifies the row being populated. In this case, we have 3 rows in our TableView, so the function cellForRowAtIndexPath will be called 3 times. Each time it is called, the value of "row" will increase by 1 starting at 0. 
        //let taskDict:Dictionary = taskArray[indexPath.row]
        //Give back this specific task for this row in my tableView from my taskArray:
        let thisTask = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        //Refactor the code to grab thisTask from the struct
        //cell.taskLabel.text = taskDict["task"]
        //cell.descriptionLabel.text = taskDict["subtask"]
        //cell.dateLabel.text = taskDict["date"]
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
   
        return cell
    }
    
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        //Looks for segue called showTaskDetail -- looks for place to go - this one is a show segue
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }


}

