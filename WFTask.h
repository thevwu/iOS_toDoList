//
//  WFTask.h
//  todoList
//
//  Created by Victor Wu on 3/15/16.
//  Copyright © 2016 wayfair. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef NS_ENUM(NSInteger, WFTaskPriority) {
    WFTaskPriorityLow,
    WFTaskPriorityMedium,
    WFTaskPriorityHigh
};

@interface WFTask : NSObject
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *taskDescription;
@property (nonatomic, retain) NSDate *dueDate;
@property (nonatomic, retain) NSDate *createdDate;
@property (nonatomic) BOOL isComplete;
@property (nonatomic) WFTaskPriority priority;
@property (nonatomic, retain) CLLocation *location;

- (id)initWithTitle:(NSString *)title taskDescription:(NSString *)description dueDate:(NSDate *)dueDate priority:(WFTaskPriority)priority;


@end
