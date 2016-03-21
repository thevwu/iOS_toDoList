//
//  TaskCell.h
//  todoList
//
//  Created by Victor Wu on 3/16/16.
//  Copyright © 2016 wayfair. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *bodyLabel;

- (void) configureLayout;

@end
