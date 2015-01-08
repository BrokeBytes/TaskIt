//
//  TaskModel.swift
//  TaskIt
//
//  Created by James Dykstra on 1/5/15.
//  Copyright (c) 2015 Broke Bytes. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
