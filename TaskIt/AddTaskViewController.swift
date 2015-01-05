//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by James Dykstra on 1/4/15.
//  Copyright (c) 2015 Broke Bytes. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    var mainVC: ViewController!

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func addTaskTapped(sender: UIButton) {
        var task = TaskModel(task: taskTextField.text, subTask: subTaskTextField.text, date: dueDatePicker.date, isComplete: false)
        mainVC.baseArray[0].append(task)
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

}
