//
//  TaskDetail.swift
//  TaskIt
//
//  Created by James Dykstra on 1/4/15.
//  Copyright (c) 2015 Broke Bytes. All rights reserved.
//

import UIKit

class TaskDetail: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var detailTaskModel:TaskModel!
    var mainVC:ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.taskTextField.text = detailTaskModel.task
        self.subtaskTextField.text = detailTaskModel.subTask
        self.dueDatePicker.date = detailTaskModel.date
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        var task = TaskModel(task: taskTextField.text, subTask: subtaskTextField.text, date: dueDatePicker.date, isComplete: false)
            mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow()!.row] = task
        
        self.navigationController?.popViewControllerAnimated(true)
    }

}
