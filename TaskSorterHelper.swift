//
//  TaskSorterHelper.swift
//  todoList
//
//  Created by Victor Wu on 3/17/16.
//  Copyright © 2016 wayfair. All rights reserved.
//

import Foundation

class TaskSorterHelper {
    class func sortTasks(tasks: [WFTask]) -> [WFTask] {
        return tasks.sort({$0.title > $1.title})
    }
}