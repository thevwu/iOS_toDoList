//
//  WFTask.m
//  todoList
//
//  Created by Victor Wu on 3/15/16.
//  Copyright © 2016 wayfair. All rights reserved.
//

#import "WFTask.h"

@implementation WFTask

- (id)initWithTitle:(NSString *)title taskDescription:(NSString *)description dueDate:(NSDate *)dueDate priority:(WFTaskPriority)priority {
    self = [super init];
    if (self) {
        _title = title;
        _taskDescription = description;
        _dueDate = dueDate;
        _priority = priority;
        _isComplete = NO;
        _createdDate = [NSDate date];
    }
    return self;
}

@end
