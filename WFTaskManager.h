//
//  WFTaskManager.h
//  todoList
//
//  Created by Victor Wu on 3/14/16.
//  Copyright © 2016 wayfair. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WFTask;

@interface WFTaskManager : NSObject
+ (WFTaskManager *)sharedInstance;
@property (nonatomic, retain) NSDictionary *tasks;
- (void)addTask:(WFTask *)task;
- (NSArray *)tasksForSection:(NSInteger)section;
- (WFTask *)taskForIndexPath:(NSIndexPath *)indexPath;
- (void)removeTaskAtIndexPath:(NSIndexPath *)indexPath;

@end
