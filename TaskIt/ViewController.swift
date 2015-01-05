//
//  ViewController.swift
//  TaskIt
//
//  Created by James Dykstra on 1/3/15.
//  Copyright (c) 2015 Broke Bytes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var baseArray:[[TaskModel]] = []
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2015, month: 1, day: 1)
        let date2 = Date.from(year: 2015, month: 1, day: 2)
        let date3 = Date.from(year: 2015, month: 1, day: 3)
        let task1 = TaskModel(task: "Study Enfglish", subTask: "Study Sentences", date: date3,isComplete: false)
        let task2 = TaskModel(task: "Gym", subTask: "Leg Day", date: date2, isComplete: false)
        var completedArray = [TaskModel(task: "Code Stuff", subTask: "Tables and Stuff in Swift", date: date1, isComplete: true)]
        
        
        //let task1:Dictionary<String,String> = ["task":"Study French", "subtask":"Verbs", "date":"wednesday"]
        //let task2:Dictionary<String,String> = ["task":"Eat French", "subtask":"Woman", "date":"everyday"]
        //let task3:Dictionary<String,String> = ["task":"Gym", "subtask":"Worksout Leg Day", "date":"Monday"]
        let taskArray = [task1, task2,  TaskModel(task: "foo", subTask: "bar", date: date1, isComplete: false)]
        
        baseArray = [taskArray, completedArray]
        
        self.tableView.reloadData()
        
//        println(task1["task"])
//        println(task1["date"])
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        func sortByDate (taskOne:TaskModel, taskTwo:TaskModel) -> Bool {
//            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//        }
//        taskArray = taskArray.sorted(sortByDate)
        
        baseArray[0] = baseArray[0].sorted{
            (taskOne:TaskModel, taskTwo:TaskModel) -> Bool in
            //comparison logic here
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        //println("Back to Main")
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailVC:TaskDetail = segue.destinationViewController as TaskDetail
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
        }
        else if segue.identifier == "showAddDetail" {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as AddTaskViewController
            addTaskVC.mainVC = self
        }
        
    }
    
    //UITableViewSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseArray[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println(indexPath.row)
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        cell.taskLabel.text = thisTask.task
        cell.subTaskLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    //UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "ToDo"
        }
        else {
            return "Completed"
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }

    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showAddDetail", sender: self)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
            //move uncomplete task complete section
        if indexPath.section == 0 {
                   var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, isComplete: true)
        baseArray[indexPath.section].removeAtIndex(indexPath.row)
        baseArray[1].append(newTask) 
        }
            //move completed task to uncompleted section
        else if indexPath.section == 1 {
            var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, isComplete: false)
            baseArray[indexPath.section].removeAtIndex(indexPath.row)
            baseArray[0].append(newTask)
        }

        tableView.reloadData()
        
    }
    //Helpers
    


}

